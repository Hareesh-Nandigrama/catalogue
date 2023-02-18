import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/items.dart';

const baseUrl = 'https://kamengkriti.onrender.com/';

Future<Map<String, dynamic>> getPendingOrders() async {
  print('inget id');
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('access_token');
  print(accessToken);

  final response = await http.get(Uri.parse('${baseUrl}api/order/pending'),
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Token $accessToken'
      });
  print(response.body);

  final body = jsonDecode(response.body);

  print(body);

  return body;
}

Future<Map<String, dynamic>> getAcceptedOrders() async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('access_token');
  print(accessToken);

  final response = await http.get(Uri.parse('${baseUrl}api/order/accepted'),
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Token $accessToken'
      });
  print(response.body);

  final body = jsonDecode(response.body);

  print(body);

  return body;
}

Future<Map<String, dynamic>> createNewOrder(
    String customerId, String shopkeeperId, List<Item> items) async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('access_token');
  print('abcd12345');
  print(accessToken);
  List<Map<String, dynamic>> itm = [];
  for(int i = 0; i < items.length; i++)
    {
      itm.add(items[i].toJson());
    }
  print('here in the big thing');
  print(itm);
  print({
    "customerId": customerId,
    "shopkeeperId": shopkeeperId,
    "items": itm,
    "description": "new order"
  });
  print(accessToken);
  final response = await http.post(Uri.parse('${baseUrl}api/order'), headers: {
    'Authorization': 'Token $accessToken'
  }, body:jsonEncode({
    "customerId": customerId,
    "shopkeeperId": shopkeeperId,
    "items": itm,
    "description": "new order"
  }),
  );
  print(response.body);

  final body = jsonDecode(response.body);

  print(body);

  return body;
}

Future<Map<String, dynamic>> acceptPendingOrder(String orderId) async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('access_token');
  print(accessToken);

  final response = await http.post(
    Uri.parse('${baseUrl}api/order/accept/$orderId'),
    headers: {
      'content-type': 'application/json',
      'Authorization': 'Token $accessToken'
    },
  );
  print(response.body);

  final body = jsonDecode(response.body);

  print(body);

  return body;
}

Future<Map<String, dynamic>> getAllOrders() async {
  final response = await http.post(
    Uri.parse('${baseUrl}api/order/all'),
    headers: {
      'content-type': 'application/json',
    },
  );
  print(response.body);

  final body = jsonDecode(response.body);

  print(body);

  return body;
}
