const mongoose = require("mongoose");

const OTPSchema = mongoose.Schema({
	otp: { type: Number, required: true },
	userId: { type: mongoose.Types.ObjectId, ref: "User" },
});

const OTP = mongoose.model("OTP", OTPSchema);
module.exports = OTP;
