const Item = require("../models/item.model");

const CreateNewItem = async (data) => {
    const newItem = await Item.create({ ...data });
    return newItem;
};
const GetAllItems = async () => {
    const allItems = await Item.find({});
    return allItems;
};

const GetMenu = async (shopkeeperId) => {
    const allItems = await Item.find({ shopkeeperId });
    return allItems;
};

const DelteItem = async (itemId) => {
    try {
        await Item.deleteOne({ _id: itemId });
        return true;
    } catch (error) {
        return false;
    }
};

const UpdateItem = async (itemId, data) => {
    try {
        await Item.findByIdAndUpdate(itemId, { ...data });
        return true;
    } catch (error) {
        return false;
    }
};

module.exports = { CreateNewItem, GetAllItems, DelteItem, GetMenu, UpdateItem };
