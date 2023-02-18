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

  print(response.body);
}

Future<List<dynamic>> getShops() async {
  print('in get shops');
  final Response response =
      await http.get(Uri.parse('${baseUrl}api/shopkeeper/all'), headers: {
    'content-type': 'application/json',
  });
  var body = jsonDecode(response.body);
  List<dynamic> answer = [];
  print(body);
  print('here 2');
  for (var json in body as List<dynamic>) {
    print(json);
    answer.add(json);
  }

  print('im returning now');
  return answer;
}

Future<dynamic> getMenu(String? shopkeeperId1) async {
  final prefs = await SharedPreferences.getInstance();
  var shopkeeperId = '';
  if (shopkeeperId1 == null) {
    final shopkeeperId = prefs.getString('_id');
  } else {
    shopkeeperId = shopkeeperId1;
  }

  print(shopkeeperId);
  print('this is');
  final response =
      await http.get(Uri.parse('${baseUrl}api/item/$shopkeeperId'), headers: {
    'content-type': 'application/json',
  });

  final body = jsonDecode(response.body);
  List<Menu> answer = [];

  print(body);

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

  print(_type);
  print('starttime');
  print(startTime);
  print(endTime);

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
  print(response.body);

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
  print("TESTING");
  print(price);
  print(itemID);
  final response = await http.put(Uri.parse('${baseUrl}api/item/:$itemID'),
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
  print(response.body);

  showSnackBar('Menu Item added');

  return body;
}

Future<Map<String, dynamic>> getCurrentShopDetails() async {
  final prefs = await SharedPreferences.getInstance();

  final access_token = prefs.getString('access_token') ?? '';
  print(access_token);

  final response = await http.get(Uri.parse('${baseUrl}api/shopkeeper'),
      headers: {
        'content-type': 'application/json',
        "Authorization": "Token $access_token"
      });

  print('printing from shop details');
  final body = jsonDecode(response.body);
  return body;
}
