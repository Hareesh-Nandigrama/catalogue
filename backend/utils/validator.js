const Joi = require("joi");

const validatePayload = (schema, obj) => {
	const joiSchema = Joi.object(schema);
	return joiSchema.validate(obj);
};

module.exports = validatePayload;
