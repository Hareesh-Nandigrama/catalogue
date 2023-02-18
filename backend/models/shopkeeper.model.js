const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");
const shopkeeperSchema = new mongoose.Schema({
	phoneNumber: {
		type: String,
		unique: true,
		required: true,
	},
	name: {
		type: String,
		required: [true, "Name is required!"],
	},
	businessName: {
		type: String,
		required: [true, "Business name is required!"],
	},

	businessType: {
		type: String,
		enum: ["foodOutlet", "stationary", "other"],
		required: true,
	},
	location: {
		type: String,
		enum: ["khoka", "core1", "core2", "core3", "core4", "core5", "kameng", "manas", "brahmaputra"],
		required: true,
	},
	photos: [
		{
			type: String,
		},
	],
	openTime: {
		type: String,
		required: true,
	},
	closeTime: {
		type: String,
		required: true,
	},
	openStatus: {
		type: Boolean,
		required: true,
		default: true,
	},
	uid: {
		type: String,
		required: true,
	},
});

shopkeeperSchema.methods.generateJWT = function () {
	var user = this;
	var token = jwt.sign({ user: user._id }, "secretsecret", {
		expiresIn: "24h",
	});
	return token;
};

shopkeeperSchema.statics.findByJWT = async function (token) {
	try {
		var user = this;
		var decoded = jwt.verify(token, "secretsecret");
		const id = decoded.user;
		const fetchedUser = user.findOne({ _id: id });
		if (!fetchedUser) return false;
		return fetchedUser;
	} catch (error) {
		return false;
	}
};

const Shopkeeper = mongoose.model("Shopkeeper", shopkeeperSchema);

module.exports = Shopkeeper;
