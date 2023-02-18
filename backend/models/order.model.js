const mongoose = require("mongoose");

const OrderSchema = mongoose.Schema(
	{
		status: {
			type: String,
			enum: ["pending", "accepted", "declined", "completed"],
			default: "pending",
		},
		customerId: { type: mongoose.Types.ObjectId, ref: "Customer" },
		shopkeeperId: { type: mongoose.Types.ObjectId, ref: "Shopkeeper" },
		description: { type: String },
		items: [
			{
				item: { type: mongoose.Types.ObjectId, ref: "Item" },
				qty: { type: Number, required: true, default: 1 },
			},
		],
		timeCreated: { type: Number, default: () => Date.now() },
		timeAutoDecline: {
			type: Number,
			default: () => Date.now() + parseInt(process.env.ORDER_AUTODECLINE_MS),
		},
	},
	{ timestamps: true }
);

const OrderModel = mongoose.model("Order", OrderSchema);

module.exports = OrderModel;
