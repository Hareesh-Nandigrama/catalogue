const express = require("express");
const router = express.Router();
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");

const CustomerController = require("../controllers/customer.controller");

router.post("/", catchAsync(CustomerController.CreateNewCustomer));

module.exports = router;
