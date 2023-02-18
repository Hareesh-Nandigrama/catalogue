const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");

const TransationServices = require("../services/transaction.services");

const CreateNewTransaction = async (req, res, next) => {
    const payloadSchema = {
        orderId: Joi.string().required(),
        transactionId: Joi.string().required(),
    };

    const data = req.body;
    const valid = validatePayload(payloadSchema, data);

    if (valid.error) {
        return next(new AppError(400, valid.error));
    }

    const newTransaction = await TransationServices.CreateNewTransaction(data);

    // req.io.to(data.shopkeeperId).emit("new-order", newOrder._id);

    return res.status(200).json({
        error: false,
        transactionCreated: true,
        orderDetails: newTransaction,
    });
};

module.exports = {
    CreateNewTransaction,
};
