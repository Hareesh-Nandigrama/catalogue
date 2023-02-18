const AppError = require("../utils/AppError");
const Shopkeeper = require("../models/shopkeeper.model");

const isSeller = async function (req, res, next) {
	let token = req.headers?.authorization?.split(" ")[1];
	if (!token) return next(new AppError(403, "Invalid token"));
	const user = await Shopkeeper.findOne({ uid: token });
	if (!user) return next(new AppError(403, "Not Authenticated"));
	req.user = user;
	return next();
};

module.exports = isSeller;
