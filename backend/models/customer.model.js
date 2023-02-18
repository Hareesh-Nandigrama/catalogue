const { default: mongoose } = require("mongoose");
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const UserSchema = new mongoose.Schema({
	name: {
		type: String,
		required: true,
	},
	phoneNumber: {
		type: String,
		required: true,
	},
	uid: {
		type: String,
		required: true,
	},
});

UserSchema.pre("save", async function (next) {
	let user = this;
	if (!user.isModified("password")) {
		return next();
	}
	const salt = await bcrypt.genSalt(10);
	const hash = await bcrypt.hashSync(user.password, salt);
	user.password = hash;

	return next();
});

UserSchema.methods.comparePassword = async function (candidatePassword) {
	const user = this;
	return bcrypt.compare(candidatePassword, user.password).catch((e) => false);
};

UserSchema.methods.generateJWT = function () {
	var user = this;
	var token = jwt.sign({ user: user._id }, "secretsecret", {
		expiresIn: "2h",
	});
	return token;
};

UserSchema.statics.findByJWT = async function (token) {
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

module.exports = mongoose.model("Customer", UserSchema);
