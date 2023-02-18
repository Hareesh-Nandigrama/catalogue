const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");

const UserServices = require("../services/customer.services");
const AuthServices = require("../services/auth.services");

console.log(AuthServices);
const User = require("../models/customer.model");
const SendEmail = require("../services/email/sendEmail");

const CreateNewUser = async (req, res, next) => {
	const payloadSchema = {
		name: Joi.string().required(),
		email: Joi.string().email().required(),
		password: Joi.string().required(),
	};

	const data = req.body;
	const valid = validatePayload(payloadSchema, data);

	if (valid.error) {
		return next(new AppError(400, valid.error));
	}

	const newUser = await UserServices.createUser(data);

	await AuthServices.GenerateOTP(newUser._id, newUser.email);

	return res.status(200).json({
		error: false,
		accountCreated: true,
		token: newUser._id,
	});
};

const VerifyOTP = async (req, res, next) => {
	const payloadSchema = {
		otp: Joi.number().required(),
		token: Joi.string().required(),
	};
	const data = req.body;
	const valid = validatePayload(payloadSchema, data);

	if (valid.error) {
		return next(new AppError(400, valid.error));
	}

	const access_token = await AuthServices.VerifyOTP(data.token, data.otp);
	if (!access_token) return next(new AppError(403, "Invalid OTP"));

	return res.status(200).json({ access_token });
};

const LoginUser = async (req, res, next) => {
	const payloadSchema = {
		email: Joi.string().email().required(),
		password: Joi.string().required(),
	};

	const data = req.body;

	const valid = validatePayload(payloadSchema, data);

	if (valid.error) {
		return next(new AppError(400, valid.error));
	}

	const existingUser = await User.findOne({ email: data.email });
	if (!existingUser) return next(new AppError(403, "Invalid email or password"));

	const matched = await existingUser.comparePassword(data.password);
	if (!matched) return next(new AppError(403, "Invalid email or password"));

	if (!existingUser.isVerified) {
		await AuthServices.GenerateOTP(existingUser._id, existingUser.email);
		return res.json({
			message: "Account not verified",
			token: existingUser._id,
		});
	}

	const access_token = existingUser.generateJWT();
	return res.status(200).json({ access_token });
};

module.exports = { CreateNewUser, LoginUser, VerifyOTP };
