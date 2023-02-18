const Transaction = require("../models/transaction.model");
const AppError = require("../utils/AppError");

// const OrderServices = require("./order.services");

const CreateNewTransaction = async (data) => {
    try {
        const newTransaction = await Transaction.create({ ...data });
        return newTransaction;
    } catch (error) {
        return { error: true };
    }
};

module.exports = { CreateNewTransaction };
