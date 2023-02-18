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

module.exports = { CreateNewItem, GetAllItems, GetMenu };
