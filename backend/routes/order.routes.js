const express = require("express");
const router = express.Router();
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");

const OrderController = require("../controllers/order.controller");

router.get("/pending", isShopkeeper, catchAsync(OrderController.GetPendingOrders));
// router.get("/unpaid", isShopkeeper, catchAsync(OrderController.GetPendingOrders));
router.get("/accepted", isShopkeeper, catchAsync(OrderController.GetAcceptedOrders));
router.get("/cancelled", isShopkeeper, catchAsync(OrderController.GetCancelledOrders));
router.get("/completed", isShopkeeper, catchAsync(OrderController.GetCompletedOrders));
router.get("/delivered", isShopkeeper, catchAsync(OrderController.GetDeliveredOrders));
router.get("/all", isShopkeeper, catchAsync(OrderController.GetAllOrders));
router.get("/details/:orderId", isShopkeeper, catchAsync(OrderController.GetOrderDetails));

// check if item available
router.post("/", catchAsync(OrderController.CreateNewOrder));

router.post("/accept/:orderId", isShopkeeper, catchAsync(OrderController.ApproveOrder));
router.post("/paid/:orderId", isShopkeeper, catchAsync(OrderController.PaidOrder));
router.post("/complete/:orderId", isShopkeeper, catchAsync(OrderController.CompleteOrder));
router.post("/decline/:orderId", isShopkeeper, catchAsync(OrderController.DeclineOrder));
router.post("/deliver/:orderId", isShopkeeper, catchAsync(OrderController.DeliverOrder));

module.exports = router;
