const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");

const OrderServices = require("../services/print.services");

const GetPendingOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetPendingOrders(req.user._id);
    if (!pendingOrders) return res.json({ pending: false });
    return res.json({ pending: true, orders: pendingOrders });
};

const GetAcceptedOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetAcceptedOrders(req.user._id);
    if (!pendingOrders) return res.json({ accepted: false });
    return res.json({ orders: pendingOrders });
};

const GetAllOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetAllOrders(req.user._id);
    if (!pendingOrders) return res.json({ all: false });
    return res.json({ orders: pendingOrders });
};

const CreateNewOrder = async (req, res, next) => {
    const payloadSchema = {
        customerId: Joi.string().required(),
        shopkeeperId: Joi.string().required(),
        type: Joi.string().required(),
        files: Joi.array(),
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
    console.log(req.user);
    const approvedOrder = await OrderServices.ApproveOrder(orderId, req.user._id);

    req.io.to(approvedOrder.customerId.toString()).emit("accepted-order", approvedOrder._id);

    res.json({ approved: true, order: approvedOrder });
};

const CompleteOrder = async (req, res, next) => {
    const { orderId } = req.params;
    const approvedOrder = await OrderServices.CompleteOrder(orderId);

    // req.io.to(approvedOrder.customerId.toString()).emit("accepted-order", approvedOrder._id);

    res.json({ complete: true, order: approvedOrder });
};
// const GetOrderDetails = async (req, res, next) => {
// 	return res.json(req.user);
// };

module.exports = {
    GetPendingOrders,
    CreateNewOrder,
    ApproveOrder,
    GetAcceptedOrders,
    GetAllOrders,
    CompleteOrder,
};
