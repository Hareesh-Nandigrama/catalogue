import 'dart:convert';

import 'package:catalogue/controllers/otp_auth.dart';
import 'package:catalogue/models/menu.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = 'https://kamengkriti.onrender.com/';

Future<void> getShopkeeper() async {
  final prefs = await SharedPreferences.getInstance();

  final access_token = prefs.getString('access_token') ?? '';

  final response = await http.get(Uri.parse('${baseUrl}api/shopkeeper'),
      headers: {
        'content-type': 'application/json',
        "Authorization": "Token $access_token"
      });


}

Future<List<dynamic>> getShops() async {
  final Response response =
      await http.get(Uri.parse('${baseUrl}api/shopkeeper/all'), headers: {
    'content-type': 'application/json',
  });
  var body = jsonDecode(response.body);
  List<dynamic> answer = [];

  for (var json in body as List<dynamic>) {

    answer.add(json);
  }

  return answer;
}

Future<dynamic> getMenu() async {
  final prefs = await SharedPreferences.getInstance();

  final shopkeeperId = prefs.getString('_id');

  final response =
      await http.get(Uri.parse('${baseUrl}api/item/$shopkeeperId'), headers: {
    'content-type': 'application/json',
  });

  final body = jsonDecode(response.body);
  List<Menu> answer = [];


  return body;
}

Future<Map<String, dynamic>> createMenu(
    String name,
    String price,
    String type,
    String shopkeeperId,
    String category,
    String description,
    String startTime,
    String endTime) async {
  final prefs = await SharedPreferences.getInstance();
  final shopkeeperId = prefs.getString('_id');

  var access_token = prefs.getString('access_token') ?? '';

  final _type = type.toLowerCase();


  final response = await http.post(Uri.parse('${baseUrl}api/item'),
      headers: {
        'content-type': 'application/json',
        "Authorization": "Token $access_token"
      },
      body: jsonEncode({
        "name": name,
        "price": price,
        "type": _type,
        "shopkeeperId": shopkeeperId,
        "startTime": startTime,
        "endTime": endTime,
        "category": 'juefjhjhkfdhkjsfjh',
        "description": description
      }));

  final body = jsonDecode(response.body);


  showSnackBar('Menu Item added');

  return body;
}

Future<Map<String, dynamic>> editMenu(
    String name,
    String price,
    String type,
    String shopkeeperId,
    String category,
    String description,
    String startTime,
    String endTime,
    String itemID) async {
  final prefs = await SharedPreferences.getInstance();
  final shopkeeperId = prefs.getString('_id');

  var access_token = prefs.getString('access_token') ?? '';

  final _type = type.toLowerCase();

  final response = await http.put(Uri.parse('${baseUrl}api/item/$itemID'),
      headers: {
        'content-type': 'application/json',
        "Authorization": "Token $access_token"
      },
      body: jsonEncode({

        "price": price,
        "name": name,
        "type": _type,
        "shopkeeperId": shopkeeperId,
        "startTime": startTime,
        "endTime": endTime,
        "category": 'juefjhjhkfdhkjsfjh',
        "description": description
      }));

  final body = jsonDecode(response.body);

  showSnackBar('Menu Edit added');

  return body;
}

deleteItem(String id)
async {
  final prefs = await SharedPreferences.getInstance();

  final access_token = prefs.getString('access_token') ?? '';

  final response = await http.delete(Uri.parse('${baseUrl}api/item/$id'),
      headers: {
        'content-type': 'application/json',
        "Authorization": "Token $access_token"
      });

  final body = jsonDecode(response.body);
  return body;
}

Future<Map<String, dynamic>> getCurrentShopDetails() async {
  final prefs = await SharedPreferences.getInstance();

  final access_token = prefs.getString('access_token') ?? '';

  final response = await http.get(Uri.parse('${baseUrl}api/shopkeeper'),
      headers: {
        'content-type': 'application/json',
        "Authorization": "Token $access_token"
      });

  final body = jsonDecode(response.body);
  return body;
}
