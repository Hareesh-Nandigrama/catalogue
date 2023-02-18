import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = 'https://kamengkriti.onrender.com/';

Future<void> createShopkeeper(
    String phoneNumber,
    String name,
    String businessName,
    String businessType,
    String location,
    String closeTime,
    String openTime,
    List<String> photos,
    String uid) async {
  final body = jsonEncode({
    "phoneNumber": phoneNumber,
    "name": name,
    "businessName": businessName,
    "businessType": 'stationary',
    "location": location,
    "openTime": openTime,
    "closeTime": closeTime,
    "photos": photos,
    "uid": uid,
    "description": "hello"
  });

  final response = await http.post(Uri.parse('${baseUrl}api/shopkeeper'),
      body: body, headers: {'content-type': 'application/json'});

  print(response.body);
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString('access_token', uid);

  final res_body = jsonDecode(response.body);

  prefs.setString('_id', res_body['shopkeeper']['_id']);
}

Future<void> createCustomer(String phoneNumber, String name, String uid) async {
  final body = jsonEncode({
    "phoneNumber": phoneNumber,
    "name": name,
    "uid": uid,
  });

  final response = await http.post(
    Uri.parse('${baseUrl}api/customer'),
    body: body,
    headers: {'content-type': 'application/json'},
  );

  final res_body = jsonDecode(response.body);
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('_id', res_body['customerData']['_id']);
  await prefs.setString('access_token', uid);
}
