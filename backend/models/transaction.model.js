const mongoose = require("mongoose");

const TxnSchema = mongoose.Schema({
    orderId: { type: String },
    transactionId: { type: String },
});

const TransactionModel = mongoose.model("Transaction", TxnSchema);

module.exports = TransactionModel;
