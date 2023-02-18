const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");

const OrderServices = require("../services/order.services");
const OrderModel = require("../models/order.model");

const GetPendingOrders = async (req, res, next) => {
    const data = await OrderServices.GetPendingOrders(req.user._id);
    if (!data) return res.json({ pending: false });
    return res.json({
        pending: true,
        orders: [...data.pendingOrders, ...data.unpaidOrders],
    });
};

const GetCancelledOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetCancelledOrders(req.user._id);
    if (!pendingOrders) return res.json({ cancelled: false });
    return res.json({ cancelled: true, orders: pendingOrders });
};

const GetCompletedOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetCompletedOrders(req.user._id);
    if (!pendingOrders) return res.json({ completed: false });
    return res.json({ completed: true, orders: pendingOrders });
};
const GetAcceptedOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetAcceptedOrders(req.user._id);
    if (!pendingOrders) return res.json({ accepted: false });
    return res.json({ accepted: true, orders: pendingOrders });
};

const GetAllOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetAllOrders(req.user._id);
    if (!pendingOrders) return res.json({ all: false });
    return res.json({ orders: pendingOrders });
};

const CreateNewOrder = async (req, res, next) => {
    const itemSchema = {
        item: Joi.string().required(),
        qty: Joi.number().required(),
    };
    const payloadSchema = {
        customerId: Joi.string().required(),
        shopkeeperId: Joi.string().required(),
        items: Joi.array().items(itemSchema).required(),
        description: Joi.string().max(200).required(),
    };

    const data = req.body;
    const valid = validatePayload(payloadSchema, data);

    if (valid.error) {
        return next(new AppError(400, valid.error));
    }

    const newOrder = await OrderServices.CreateNewOrder(data);

    req.io.to(data.shopkeeperId).emit("new-order", newOrder._id);

    return res.status(200).json({
        error: false,
        orderCreated: true,
        orderDetails: newOrder,
    });
};

const ApproveOrder = async (req, res, next) => {
    const { orderId } = req.params;
    const approvedOrder = await OrderServices.ApproveOrder(orderId, req.user._id);

    req.io.to(approvedOrder.customerId.toString()).emit("accepted-order", approvedOrder._id);

    res.json({ approved: true, order: approvedOrder });
};

const PaidOrder = async (req, res, next) => {
    const { orderId } = req.params;
    const approvedOrder = await OrderServices.PaidOrder(orderId, req.user._id);

    req.io.to(approvedOrder.customerId.toString()).emit("accepted-order", approvedOrder._id);

    res.json({ approved: true, order: approvedOrder });
};

const CompleteOrder = async (req, res, next) => {
    const { orderId } = req.params;
    const approvedOrder = await OrderServices.CompleteOrder(orderId);

    // req.io.to(approvedOrder.customerId.toString()).emit("accepted-order", approvedOrder._id);

    res.json({ complete: true, order: approvedOrder });
};

const DeclineOrder = async (req, res, next) => {
    const { orderId } = req.params;
    const approvedOrder = await OrderServices.DeclineOrder(orderId);

    // req.io.to(approvedOrder.customerId.toString()).emit("accepted-order", approvedOrder._id);

    res.json({ complete: true, order: approvedOrder });
};

const GetOrderDetails = async (req, res, next) => {
    const { orderId } = req.params;
    const order = await OrderModel.findById(orderId).populate("items.item");
    return res.json({ order: order });
};

module.exports = {
    GetPendingOrders,
    CreateNewOrder,
    ApproveOrder,
    GetAcceptedOrders,
    GetAllOrders,
    CompleteOrder,
    GetCancelledOrders,
    GetCompletedOrders,
    DeclineOrder,
    GetOrderDetails,
    PaidOrder,
};
