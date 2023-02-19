const express = require("express");
const router = express.Router();
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");
const isAuthenticated = require("../middleware/isAuthenticated");

const CustomerController = require("../controllers/customer.controller");

router.post("/", catchAsync(CustomerController.CreateNewCustomer));
router.get("/orders", isAuthenticated, catchAsync(CustomerController.GetMyOrders));
router.get("/orders/pending", isAuthenticated, catchAsync(CustomerController.GetMyPendingOrders));
router.get("/orders/unpaid", isAuthenticated, catchAsync(CustomerController.GetMyUnpaidOrders));
router.get("/orders/accepted", isAuthenticated, catchAsync(CustomerController.GetMyAcceptedOrders));
router.get("/orders/pickup", isAuthenticated, catchAsync(CustomerController.PickUp));
router.get(
    "/orders/completed",
    isAuthenticated,
    catchAsync(CustomerController.GetMyCompletedOrders)
);
router.post("/accept/:orderId", isAuthenticated, catchAsync(CustomerController.AcceptOrder));
module.exports = router;
