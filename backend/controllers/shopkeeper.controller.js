const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");

const UserServices = require("../services/customer.services");
const AuthServices = require("../services/auth.services");
const ShopkeeperServices = require("../services/shopkeeper.services");
const OrderServices = require("../services/order.services");

const User = require("../models/customer.model");
const SendEmail = require("../services/email/sendEmail");
const Shopkeeper = require("../models/shopkeeper.model");

const CreateNewShopkeeper = async (req, res, next) => {
    const payloadSchema = {
        phoneNumber: Joi.string().length(10).required(),
        // email: Joi.string().email().required(),
        name: Joi.string().required(),
        businessName: Joi.string().required(),
        businessType: Joi.string().required(),
        location: Joi.string().max(200).required(),
        openTime: Joi.string().required(),
        closeTime: Joi.string().required(),
        description: Joi.string().required(),
        photos: Joi.array().items(Joi.string().required()),
        uid: Joi.string().required(),
    };

    const data = req.body;
    const valid = validatePayload(payloadSchema, data);

    if (valid.error) {
        return next(new AppError(400, valid.error));
    }

    const newShopkeeper = await ShopkeeperServices.CreateNewShopkeeper(data);

    //AUTH LOGIC HERE

    return res.status(200).json({
        error: false,
        accountCreated: true,
        shopkeeper: newShopkeeper,
    });
};

const GetShopkeeperDetails = async (req, res, next) => {
    return res.json({
        loggedIn: true,
        user: req.user,
    });
};

const GetShop = async (req, res, next) => {
    const { phoneNumber } = req.params;
    const shop = await Shopkeeper.findOne({ phoneNumber });
    return res.json({
        shop: shop,
    });
};

const GetPendingOrders = async (req, res, next) => {
    const pendingOrders = await OrderServices.GetPendingOrders(req.user._id);
    if (!pendingOrders) return res.json({ pending: false });
    return res.json({ pending: true, orders: pendingOrders });
};

const GetAllShops = async (req, res, next) => {
    const allShops = await ShopkeeperServices.GetAllShops();

    res.json(allShops);
};

const EditShopkeeper = async (req, res, next) => {
    const { data } = req.body;
    await Shopkeeper.findByIdAndUpdate(req.user._id, data);
    return res.json({ updated: true });
};

module.exports = {
    CreateNewShopkeeper,
    GetPendingOrders,
    GetShopkeeperDetails,
    GetAllShops,
    EditShopkeeper,
    GetShop,
};
