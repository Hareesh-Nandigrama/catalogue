// // To parse this JSON data, do
// //
// //     final menu = menuFromJson(jsonString);

// import 'dart:convert';

// Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

// String menuToJson(Menu data) => json.encode(data.toJson());

// class Menu {
//   Menu({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.type,
//     required this.photo,
//     required this.shopkeeperId,
//     required this.category,
//     required this.description,
//     required this.isAvailable,
//     required this.startTime,
//     required this.endTime,
//     required this.v,
//   });

//   String id;
//   String name;
//   int price;
//   String type;
//   String photo;
//   String shopkeeperId;
//   String category;
//   String description;
//   bool isAvailable;
//   int startTime;
//   int endTime;
//   int v;

//   factory Menu.fromJson(Map<String, dynamic> json) => Menu(
//         id: json["_id"],
//         name: json["name"],
//         price: json["price"],
//         type: json["type"],
//         photo: json["photo"] ?? '',
//         shopkeeperId: json["shopkeeperId"],
//         category: json["category"],
//         description: json["description"],
//         isAvailable: json["isAvailable"],
//         startTime: json["startTime"],
//         endTime: json["endTime"],
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "price": price,
//         "type": type,
//         "photo": photo,
//         "shopkeeperId": shopkeeperId,
//         "category": category,
//         "description": description,
//         "isAvailable": isAvailable,
//         "startTime": startTime,
//         "endTime": endTime,
//         "__v": v,
//       };
// }
