const mongoose = require("mongoose");

const PrintSchema = mongoose.Schema({
    type: { type: String, enum: ["color", "nocolor"], default: "color" },
    files: [{ type: String }],
    status: {
        type: String,
        enum: ["pending", "accepted", "declined", "completed"],
        default: "pending",
    },
    customerId: { type: mongoose.Types.ObjectId, ref: "Customer" },
    shopkeeperId: { type: mongoose.Types.ObjectId, ref: "Shopkeeper" },
});

const PrintModel = mongoose.model("Print", PrintSchema);

module.exports = PrintModel;
