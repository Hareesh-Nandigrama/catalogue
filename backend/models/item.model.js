const mongoose = require("mongoose");

const ItemSchema = mongoose.Schema({
	name: { type: String, required: true },
	price: { type: Number, required: true },
	type: { type: String, enum: ["veg", "nonveg"], default: "nonveg" },
	photo: { type: String, required: true },
	shopkeeperId: { type: mongoose.Types.ObjectId, ref: "Shopkeeper" },
	category: { type: String },
	description: { type: String },
	isAvailable: { type: Boolean, default: true },
	startTime: { type: Number, required: true },
	endTime: { type: Number, required: true },
});

const ItemModel = mongoose.model("Item", ItemSchema);

module.exports = ItemModel;
