const mongoose = require("mongoose");
require("dotenv").config();

const Customer = require("../models/customer.model");
const Shopkeeper = require("../models/shopkeeper.model");
const Order = require("../models/order.model");
const Item = require("../models/item.model");
const Auth = require("../models/auth.model");

mongoose.connect(process.env.MONGO_URI, {}).then(async () => {
	// await Customer.deleteMany({});
	// await Shopkeeper.deleteMany({});
	await Order.deleteMany({});
	// await Item.deleteMany({});
	// await Auth.deleteMany({});
	console.log("DB Destroyed");
	process.exit(0);
});
