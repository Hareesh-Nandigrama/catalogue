const express = require("express");
const router = express.Router();
const catchAsync = require("../utils/catchAsync");
const isShopkeeper = require("../middleware/isShopkeeper");

const ItemController = require("../controllers/item.controller");

router.get("/", catchAsync(ItemController.GetAllItems));
router.get("/:shopkeeperId", catchAsync(ItemController.GetMenu));
router.post("/", catchAsync(ItemController.CreateNewItem));
// delete item
// disable item

module.exports = router;
