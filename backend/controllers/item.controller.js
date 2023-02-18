const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");

const ItemServices = require("../services/item.services");

const CreateNewItem = async (req, res, next) => {
	const payloadSchema = {
		name: Joi.string().min(5).max(50).required(),
		price: Joi.number().min(0).required(),
		type: Joi.string().min(2).required(),
		photo: Joi.string().min(2).required(),
		shopkeeperId: Joi.string().min(2).required(),
		category: Joi.string().min(2).required(),
		description: Joi.string().min(2).required(),
		startTime: Joi.number().min(0).required(),
		endTime: Joi.number().min(0).required(),
	};

	const data = req.body;
	const valid = validatePayload(payloadSchema, data);

	if (valid.error) {
		return next(new AppError(400, valid.error));
	}

	const newItem = await ItemServices.CreateNewItem(data);

	return res.status(200).json({
		error: false,
		itemCreated: true,
		itemDetails: newItem,
	});
};

const GetAllItems = async (req, res, next) => {
	const items = await ItemServices.GetAllItems();
	res.json(items);
};

const GetMenu = async (req, res, next) => {
	const { shopkeeperId } = req.params;
	console.log(shopkeeperId);
	const menu = await ItemServices.GetMenu(shopkeeperId);
	res.json(menu);
};

module.exports = { CreateNewItem, GetAllItems, GetMenu };
