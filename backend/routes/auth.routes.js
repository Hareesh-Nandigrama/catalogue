const { Router } = require("express");
const catchAsync = require("../utils/catchAsync");

const AuthController = require("../controllers/auth.controller");

const router = Router();

router.post("/", catchAsync(AuthController.CreateNewUser));
router.post("/verify", catchAsync(AuthController.VerifyOTP));
router.post("/login", catchAsync(AuthController.LoginUser));

module.exports = router;
