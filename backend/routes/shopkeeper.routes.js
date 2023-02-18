const express = require("express");
const router = express.Router();
const joi = require("joi");
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");

const ShopkeeperController = require("../controllers/shopkeeper.controller");

router.get("/", isShopkeeper, catchAsync(ShopkeeperController.GetShopkeeperDetails));
router.get("/all", catchAsync(ShopkeeperController.GetAllShops));
router.post("/", catchAsync(ShopkeeperController.CreateNewShopkeeper));
// router.get("/protected", isShopkeeper, catchAsync(ShopkeeperController.GetPendingOrders));

// fetch my menu

module.exports = router;
