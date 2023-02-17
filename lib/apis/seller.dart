import 'dart:convert';

import 'package:http/http.dart' as http;
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
