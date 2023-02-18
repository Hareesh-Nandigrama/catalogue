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
    const allOrders = await Orders.find({ customerId: customerId });
    return allOrders;
};

const GetMyPendingOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "pending" });
    return allOrders;
};

const GetMyUnpaidOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "awaiting-payment" });
    return allOrders;
};

const GetMyAcceptedOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "accepted" });
    return allOrders;
};
const GetMyCompletedOrders = async (customerId) => {
    const allOrders = await Orders.find({ customerId: customerId, status: "completed" });
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
