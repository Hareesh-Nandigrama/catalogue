const CustomerServices = require("../services/customer.services");
const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");
const CreateNewCustomer = async (req, res, next) => {
	const payloadSchema = {
		phoneNumber: Joi.string().length(10).required(),
		name: Joi.string().min(2).required(),
		uid: Joi.string().min(2).required(),
	};

	const data = req.body;
	const valid = validatePayload(payloadSchema, data);

	if (valid.error) {
		return next(new AppError(400, valid.error));
	}

	const newCustomer = await CustomerServices.CreateNewCustomer(data);

	res.json({
		error: false,
		customerCreated: true,
		customerData: newCustomer,
	});
};

module.exports = { CreateNewCustomer };
