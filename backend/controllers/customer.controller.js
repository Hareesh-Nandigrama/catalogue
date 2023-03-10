const CustomerServices = require("../services/customer.services");
const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");
const Order = require("../models/order.model");

const CreateNewCustomer = async (req, res, next) => {
    const payloadSchema = {
        phoneNumber: Joi.string().required(),
        name: Joi.string().required(),
        uid: Joi.string().required(),
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

const GetMyOrders = async (req, res, next) => {
    // console.log(req.user._id);
    const allOrders = await CustomerServices.GetMyOrders(req.user._id);

    return res.json({
        allOrders: allOrders,
    });
};

const GetMyPendingOrders = async (req, res, next) => {
    // console.log(req.user._id);
    const allOrders = await CustomerServices.GetMyPendingOrders(req.user._id);

    return res.json({
        allOrders: allOrders,
    });
};

const GetMyUnpaidOrders = async (req, res, next) => {
    // console.log(req.user._id);
    const allOrders = await CustomerServices.GetMyUnpaidOrders(req.user._id);

    return res.json({
        allOrders: allOrders,
    });
};

const GetMyAcceptedOrders = async (req, res, next) => {
    // console.log(req.user._id);
    const allOrders = await CustomerServices.GetMyAcceptedOrders(req.user._id);

    return res.json({
        allOrders: allOrders,
    });
};

const GetMyCompletedOrders = async (req, res, next) => {
    // console.log(req.user._id);
    const allOrders = await CustomerServices.GetMyCompletedOrders(req.user._id);

    return res.json({
        allOrders: allOrders,
    });
};

const AcceptOrder = async (req, res, next) => {
    // console.log(req.user._id);
    const { orderId } = req.params;
    const accepted = await Order.findByIdAndUpdate(orderId, { status: "accepted" }, { new: true });

    return res.json({
        accepted: true,
        order: accepted,
    });
};

const PickUp = async (req, res, next) => {
    // console.log(req.user._id);
    // const { orderId } = req.params;
    const accepted = await Order.find({ status: "accepted", customerId: req.user._id });
    const completed = await Order.find({ status: "completed", customerId: req.user._id });

    return res.json({
        accepted: true,
        orders: [...accepted, ...completed],
    });
};

module.exports = {
    CreateNewCustomer,
    GetMyOrders,
    GetMyPendingOrders,
    GetMyAcceptedOrders,
    GetMyUnpaidOrders,
    GetMyCompletedOrders,
    AcceptOrder,
    PickUp,
};
