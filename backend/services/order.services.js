const Orders = require("../models/order.model");
const AppError = require("../utils/AppError");

const GetPendingOrders = async (shopkeeperId) => {
    const pendingOrders = await Orders.find({
        shopkeeperId: shopkeeperId,
        status: "pending",
    })
        .populate("items.item", ["name", "price"])
        .select("-__v -shopkeeperId");
    if (pendingOrders.length === 0) return false;
    return pendingOrders;
};

const GetAcceptedOrders = async (shopkeeperId) => {
    const pendingOrders = await Orders.find({
        shopkeeperId: shopkeeperId,
        status: "accepted",
    })
        .populate("items.item", ["name", "price"])
        .select("-__v -shopkeeperId");
    if (pendingOrders.length === 0) return false;
    return pendingOrders;
};

const GetAllOrders = async (shopkeeperId) => {
    const pendingOrders = await Orders.find({})
        .populate("items.item", ["name", "price"])
        .select("-__v -shopkeeperId");
    if (pendingOrders.length === 0) return false;
    return pendingOrders;
};

const ApproveOrder = async (orderId, shopkeeperId) => {
    const existingOrder = await Orders.findById(orderId);
    if (!existingOrder) {
        throw new AppError(404, "Order not found");
        return;
    }

    if (!existingOrder.shopkeeperId.equals(shopkeeperId)) {
        throw new AppError(403, "Not authorized!");
        return;
    }

    const order = await Orders.findByIdAndUpdate(orderId, { status: "accepted" }, { new: true });
    return order;
};
const DeclineOrder = async (orderId) => {
    const existingOrder = await Orders.findById(orderId);
    if (!existingOrder) {
        throw new AppError(404, "Order not found");
        return;
    }
    const order = await Orders.findByIdAndUpdate(orderId, { status: "declined" });
    return order;
};
const CompleteOrder = async (orderId) => {
    const order = await Orders.findByIdAndUpdate(orderId, { status: "completed" });
    return order;
};

const CreateNewOrder = async (data) => {
    const newOrder = await Orders.create({ ...data });
    return newOrder;
};

module.exports = {
    GetPendingOrders,
    CreateNewOrder,
    DeclineOrder,
    ApproveOrder,
    CompleteOrder,
    GetAllOrders,
    GetAcceptedOrders,
};
