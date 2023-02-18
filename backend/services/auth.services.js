const User = require("../models/customer.model");
const OTP = require("../models/auth.model");
const SendEmail = require("./email/sendEmail");

const GenerateOTP = async (userId, userEmail) => {
	const existingOTP = await OTP.findOne({ userId: userId });
	if (existingOTP) {
		await OTP.deleteMany({ userId: userId });
	}
	var otp = Math.floor(1000 + Math.random() * 9000);
	const newOTP = await OTP.create({
		otp: otp,
		userId: userId,
	});
	SendEmail(userEmail, otp);
};

const VerifyOTP = async (userId, candidateOTP) => {
	try {
		const existingOTP = await OTP.findOne({ userId: userId });

		if (!existingOTP) return false;
		if (existingOTP.otp !== candidateOTP) return false;

		await OTP.deleteMany({ userId: userId });
		const user = await User.findByIdAndUpdate(userId, { isVerified: true });
		const access_token = user.generateJWT();

		if (!user) return false;
		return access_token;
	} catch (error) {
		return false;
	}
};

module.exports = { GenerateOTP, VerifyOTP };
