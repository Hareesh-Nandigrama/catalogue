const AppError = require("../utils/AppError");
const User = require("../models/customer.model");

const isAuthenticated = async function (req, res, next) {
	let token = req.headers?.authorization?.split(" ")[1];
	if (!token) return next(new AppError(403, "Invalid token"));
	const user = await User.findOne({ uid: token });
	if (!user) return next(new AppError(403, "Not Authenticated"));
	req.user = user;
	return next();
};

module.exports = isAuthenticated;
