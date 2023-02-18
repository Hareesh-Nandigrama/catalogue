const express = require("express");
const router = express.Router();
const joi = require("joi");
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");

const TransactionController = require("../controllers/transaction.controller");

router.post("/", catchAsync(TransactionController.CreateNewTransaction));
// router.get("/protected", isShopkeeper, catchAsync(ShopkeeperController.GetPendingOrders));

// fetch my menu

module.exports = router;
