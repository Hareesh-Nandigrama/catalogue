const Customer = require("../models/customer.model");
const Orders = require("../models/order.model");

const CreateNewCustomer = async (data) => {
    try {
        const newUser = await Customer.create({ ...data });
        return newUser;
    } catch (error) {
        return { alreadyExists: true };
    }
};

const GetMyOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId })
        .populate("items.item", ["name", "price", "type"])
        .select("-__v -shopkeeperId");
    return allOrders;
};

const GetMyPendingOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "pending" })
        .populate("items.item", ["name", "price", "type"])
        .select("-__v -shopkeeperId");
    return allOrders;
};

const GetMyUnpaidOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "awaiting-payment" })
        .populate("items.item", ["name", "price", "type"])
        .select("-__v -shopkeeperId");
    return allOrders;
};

const GetMyAcceptedOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "accepted" })
        .populate("items.item", ["name", "price", "type"])
        .select("-__v -shopkeeperId");
    return allOrders;
};
const GetMyCompletedOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "completed" })
        .populate("items.item", ["name", "price", "type"])
        .select("-__v -shopkeeperId");
    return allOrders;
};

module.exports = {
    CreateNewCustomer,
    GetMyOrders,
    GetMyUnpaidOrders,
    GetMyAcceptedOrders,
    GetMyPendingOrders,
    GetMyCompletedOrders,
};
