const mongoose = require("mongoose");

const ItemSchema = mongoose.Schema({
    name: { type: String, required: true },
    price: { type: Number, required: true },
    type: { type: String, default: "nonveg" },
    // photo: { type: String, required: true },
    shopkeeperId: { type: mongoose.Types.ObjectId, ref: "Shopkeeper" },
    category: { type: String },
    description: { type: String },
    isAvailable: { type: Boolean, default: true },
    startTime: { type: String, required: true },
    endTime: { type: String, required: true },
});

const ItemModel = mongoose.model("Item", ItemSchema);

module.exports = ItemModel;
