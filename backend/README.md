# Kameng Kriti API

### Documentation

---

Frontend specific endpoints.

## Shopkeeper

---

> **`Get Shopkeeper Details`** **`PROTECTED`**

Sends logged in Shopkeeper details

---

| GET | /api/shopkeeper/ |
| --- | --- |

Response

```json
{
	"loggedIn": true,
	"user": {
		"_id": "63e5bc096d36774ef2acae1e",
		"phoneNumber": "2323442332",
		"name": "TESTS",
		"businessName": "TEST Shop",
		"email": "test@test.com",
		"businessType": "foodOutlet",
		"location": "core3",
		"photos": [
			"url://",
			"url2://"
		],
		"openTime": "09",
		"closeTime": "23",
		"description": "Very good shop!",
		"openStatus": true,
		"uid": "qwerty",
		"__v": 0
	}
}
```

---

> **`Create Shopkeeper`**

Login to existing account, sends back access_token, if account not verified, sends back token

---

| POST | /api/shopkeeper |
| --- | --- |
| Body | phoneNumber, email, name, businessName, businessType, location, openTime, closeTime, photos, description, uid |

**businessType**: `enum`: ["foodOutlet", "stationary", "other"],

**location**: `enum`: ["khoka", "core1", "core2", "core3", "core4", "core5", "Kameng", "Manas", "Brahmaputra"],

**openTime**: `Number` eg. 8am will translate to 800 and 8pm to 2000, 8.30pm to 2030

**closeTime**: `Number` eg. 8am will translate to 800 and 8pm to 2000, 8.30pm to 2030

Request body

```json
{
	"phoneNumber":"2323442332",
	"email":"test@test.com",
	"name":"TESTS",
	"businessName":"TEST Shop",
	"businessType":"foodOutlet",
	"location":"core3",
	"openTime":900,
	"closeTime":2300,
	"photos":["url://","url2://"],
	"description":"Very good shop!",
	"uid":"qwerty"
}
```

Response

```json
{
	"error": false,
	"accountCreated": true,
	"shopkeeper": {
		"phoneNumber": "2323442333",
		"name": "TESTS",
		"businessName": "TEST Shop",
		"email": "test@test.com",
		"businessType": "foodOutlet",
		"location": "core3",
		"photos": [
			"url://",
			"url2://"
		],
		"openTime": 900,
		"closeTime": 2300,
		"description": "Very good shop!",
		"openStatus": true,
		"uid": "qwerty",
		"_id": "63e7a5e2bfb1aa382f7256e2",
		"__v": 0
	}
}
```

## Orders

> **`Create New Order` `PROTECTED`** 

Create a new order.

---

| POST | /api/order |
| --- | --- |
| Body | customerId, shopkeeperId, items, description |

**items**: `array of objects`: [{item : **`itemId`**, qty: **`number`**}],

Request body

```json
{
	"customerId":"63e5c3461b0f36a1024bad65",
	"shopkeeperId":"63e5bc096d36774ef2acae1e",
	"items": [{
		"item":"63e5c6257cae39bec871b537",
		"qty":3
	}],
	"description":"new order"
}
```

Response

```json
{
	"error": false,
	"orderCreated": true,
	"orderDetails": {
		"status": "pending",
		"customerId": "63e5c3461b0f36a1024bad65",
		"shopkeeperId": "63e5bc096d36774ef2acae1e",
		"description": "new order",
		"items": [
			{
				"item": "63e5c6257cae39bec871b537",
				"qty": 3,
				"_id": "63e5cc43b6f7388f262eae93"
			}
		],
		"_id": "63e5cc43b6f7388f262eae92",
		"__v": 0
	}
}
```

---

> **`Get pending orders` `PROTECTED`**

Returns pending orders

---

| GET | /api/order/pending |
| --- | --- |

Response

```json
{
	"pending": true,
	"orders": [
		{
			"_id": "63e5cc3eb6f7388f262eae8f",
			"status": "pending",
			"customerId": "63e5c3461b0f36a1024bad65",
			"description": "new order",
			"items": [
				{
					"item": {
						"_id": "63e5c6257cae39bec871b537",
						"name": "Chicken Chowmein",
						"price": 80
					},
					"qty": 2,
					"_id": "63e5cc3eb6f7388f262eae90"
				}
			]
		},
		{
			"_id": "63e5cc43b6f7388f262eae92",
			"status": "pending",
			"customerId": "63e5c3461b0f36a1024bad65",
			"description": "new order",
			"items": [
				{
					"item": {
						"_id": "63e5c6257cae39bec871b537",
						"name": "Chicken Chowmein",
						"price": 80
					},
					"qty": 3,
					"_id": "63e5cc43b6f7388f262eae93"
				}
			]
		}
	]
}
```

---

> **`Get accepted orders` `PROTECTED`**

Returns accepted orders

---

| GET | /api/order/accepted |
| --- | --- |

Response

```json
{
	"orders": [
		{
			"_id": "63e5c65edba40030c2bd2d18",
			"status": "accepted",
			"customerId": "63e5c3461b0f36a1024bad65",
			"description": "new order",
			"items": [
				{
					"item": {
						"_id": "63e5c6257cae39bec871b537",
						"name": "Chicken Chowmein",
						"price": 80
					},
					"qty": 2,
					"_id": "63e5c65edba40030c2bd2d19"
				}
			]
		}
	]
}
```

---

> **`Accept Pending order` `PROTECTED`**

Accept new order

---

| POST | /api/order/accept/:orderId |
| --- | --- |
| Params | orderId |

Response

```json
{
	"approved": true,
	"order": {
		"_id": "63e5c65edba40030c2bd2d18",
		"status": "accepted",
		"customerId": "63e5c3461b0f36a1024bad65",
		"shopkeeperId": "63e5bc096d36774ef2acae1e",
		"description": "new order",
		"items": [
			{
				"item": "63e5c6257cae39bec871b537",
				"qty": 2,
				"_id": "63e5c65edba40030c2bd2d19"
			}
		],
		"__v": 0
	}
}
```

---

> **`Get All orders`** **`PROTECTED`**

---

| GET | /api/order/all |
| --- | --- |
| Body | phoneNumber, email, name, businessName, businessType, location, openTime, closeTime, photos, description, uid |

Response

```json
{
	"orders": [
		{
			"_id": "63e5c65edba40030c2bd2d18",
			"status": "accepted",
			"customerId": "63e5c3461b0f36a1024bad65",
			"description": "new order",
			"items": [
				{
					"item": {
						"_id": "63e5c6257cae39bec871b537",
						"name": "Chicken Chowmein",
						"price": 80
					},
					"qty": 2,
					"_id": "63e5c65edba40030c2bd2d19"
				}
			],
			"updatedAt": "2023-02-11T14:46:42.997Z"
		},
		{
			"_id": "63e5cc3eb6f7388f262eae8f",
			"status": "pending",
			"customerId": "63e5c3461b0f36a1024bad65",
			"description": "new order",
			"items": [
				{
					"item": {
						"_id": "63e5c6257cae39bec871b537",
						"name": "Chicken Chowmein",
						"price": 80
					},
					"qty": 2,
					"_id": "63e5cc3eb6f7388f262eae90"
				}
			]
		},
		{
			"_id": "63e5cc43b6f7388f262eae92",
			"status": "pending",
			"customerId": "63e5c3461b0f36a1024bad65",
			"description": "new order",
			"items": [
				{
					"item": {
						"_id": "63e5c6257cae39bec871b537",
						"name": "Chicken Chowmein",
						"price": 80
					},
					"qty": 3,
					"_id": "63e5cc43b6f7388f262eae93"
				}
			]
		}
	]
}
```

---

## Items

> **`Create New Item` `PROTECTED`** 

Create a new item.

---

| POST | /api/item |
| --- | --- |
| Body | name, price, type, photo, shopkeeperId, category, description, startTime, endTime |

**type:** `enum` [”veg”, “nonveg”]

Request body

```json
{
	"name":"Chicken Chowmein",
	"price":80,
	"type":"nonveg",
	"photo":"url://",
	"shopkeeperId":"63e5bc096d36774ef2acae1e",
	"category":"fastfood",
	"description":"nice",
	"startTime":1500,
	"endTime":2000
}
```

Response

```json
{
	"error": false,
	"itemCreated": true,
	"itemDetails": {
		"name": "Chicken Chowmein",
		"price": 80,
		"type": "nonveg",
		"photo": "url://",
		"shopkeeperId": "63e5bc096d36774ef2acae1e",
		"category": "fastfood",
		"description": "nice",
		"_id": "63e5c6257cae39bec871b537",
		"__v": 0
	}
}
```
