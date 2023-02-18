const Shopkeeper = require("../models/shopkeeper.model");
const AppError = require("../utils/AppError");

const OrderServices = require("./order.services");

const CreateNewShopkeeper = async (data) => {
	const newShopkeeper = await Shopkeeper.create({ ...data });
	return newShopkeeper;
};

const GetAllShops = async (data) => {
	const allShops = await Shopkeeper.find({});
	return allShops;
};

// const GetShopMenu = async (shopkeeperId) => {
// 	const menu = await Shopkeeper.find({ shopkeeperId });
// 	return menu;
// };

const LoginShopkeeper = async (phoneNumber) => {
	const existingShopkeeper = await Shopkeeper.findOne({ phoneNumber });
	console.log(existingShopkeeper);
	if (!existingShopkeeper) {
		throw new AppError(403, "Access Denied");
		return;
	}
	// Verify OTP here
	const access_token = await existingShopkeeper.generateJWT();
	return access_token;
};

module.exports = { CreateNewShopkeeper, LoginShopkeeper, GetAllShops };
