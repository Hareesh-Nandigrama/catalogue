const nodemailer = require("nodemailer");
const emailClient = {
	email: "only outlook account works currently, gmail not working for me",
	password: "",
};

const SendEmail = (to, otp) => {
	const transporter = nodemailer.createTransport({
		service: "outlook",
		auth: {
			user: emailClient.email,
			pass: emailClient.password,
		},
	});
	const options = {
		from: emailClient.email,
		to: to,
		subject: "Verify your Kriti account",
		text: "Your OTP is " + otp,
	};
	transporter.sendMail(options, function (err, info) {
		if (err) {
			console.log(err);
			return;
		}
		console.log("Sent", info.response);
	});
};

module.exports = SendEmail;
