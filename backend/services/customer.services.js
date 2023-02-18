const Customer = require("../models/customer.model");

const CreateNewCustomer = async (data) => {
	const newUser = await Customer.create({ ...data });
	return newUser;
};

module.exports = { CreateNewCustomer };
