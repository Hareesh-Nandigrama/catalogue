const express = require("express");
const router = express.Router();
const joi = require("joi");
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");

const ShopkeeperController = require("../controllers/shopkeeper.controller");

router.get("/", isShopkeeper, catchAsync(ShopkeeperController.GetShopkeeperDetails));
router.get("/all", catchAsync(ShopkeeperController.GetAllShops));
router.get("/:phoneNumber", catchAsync(ShopkeeperController.GetShop));
router.post("/", catchAsync(ShopkeeperController.CreateNewShopkeeper));
router.put("/", isShopkeeper, catchAsync(ShopkeeperController.EditShopkeeper));
// router.get("/protected", isShopkeeper, catchAsync(ShopkeeperController.GetPendingOrders));

// fetch my menu

module.exports = router;
