const Joi = require("joi");
const validatePayload = require("../utils/validator");
const AppError = require("../utils/AppError");

const ItemServices = require("../services/item.services");

const CreateNewItem = async (req, res, next) => {
    const payloadSchema = {
        name: Joi.string().max(50).required(),
        price: Joi.number().required(),
        type: Joi.string().required(),
        // photo: Joi.string().min(2).required(),
        shopkeeperId: Joi.string().required(),
        category: Joi.string().required(),
        description: Joi.string().required(),
        startTime: Joi.string().required(),
        endTime: Joi.string().required(),
    };

    const data = req.body;
    const valid = validatePayload(payloadSchema, data);

    if (valid.error) {
        return next(new AppError(400, valid.error));
    }

    const newItem = await ItemServices.CreateNewItem(data);

    return res.status(200).json({
        error: false,
        itemCreated: true,
        itemDetails: newItem,
    });
};

const GetAllItems = async (req, res, next) => {
    const items = await ItemServices.GetAllItems();
    res.json(items);
};

const GetMenu = async (req, res, next) => {
    const { shopkeeperId } = req.params;
    console.log(shopkeeperId);
    const menu = await ItemServices.GetMenu(shopkeeperId);
    res.json(menu);
};

const DelteItem = async (req, res, next) => {
    const { itemId } = req.params;
    const resp = await ItemServices.DelteItem(itemId);
    if (!resp) return res.json({ deleted: false });
    return res.json({ deleted: true });
};
const UpdateItem = async (req, res, next) => {
    const { itemId } = req.params;
    const resp = await ItemServices.UpdateItem(itemId, req.body);
    if (!resp) return res.json({ updated: false });
    return res.json({ updated: true });
};

module.exports = { CreateNewItem, GetAllItems, DelteItem, GetMenu, UpdateItem };
