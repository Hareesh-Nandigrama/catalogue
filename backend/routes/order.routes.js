const express = require("express");
const router = express.Router();
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");

const OrderController = require("../controllers/order.controller");

router.get("/pending", isShopkeeper, catchAsync(OrderController.GetPendingOrders));
router.get("/accepted", isShopkeeper, catchAsync(OrderController.GetAcceptedOrders));
router.get("/all", isShopkeeper, catchAsync(OrderController.GetAllOrders));

// check if item available
router.post("/", catchAsync(OrderController.CreateNewOrder));

router.post("/accept/:orderId", isShopkeeper, catchAsync(OrderController.ApproveOrder));
router.post("/complete/:orderId", isShopkeeper, catchAsync(OrderController.CompleteOrder));

module.exports = router;
