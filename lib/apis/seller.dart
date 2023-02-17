import 'dart:convert';

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
  final Response response =
      await http.get(Uri.parse('${baseUrl}api/shopkeeper/all'), headers: {
    'content-type': 'application/json',
  });
  var body = jsonDecode(response.body);
  List<dynamic> answer = [];
  print('here 2');
  for (var json in body as List<dynamic>) {
    print(json);
    answer.add(json);
  }


  print('im returning now');
  return answer;
}

Future<List<Menu>> getMenu(String shopkeeperId) async {
  print(shopkeeperId);
  final response =
      await http.get(Uri.parse('${baseUrl}api/item/$shopkeeperId'), headers: {
    'content-type': 'application/json',
  });

  final body = jsonDecode(response.body);
  List <Menu> answer = [];
  print('menu');
  print(body);
  for(var e in body)
    {
      answer.add(Menu.fromJson(e));
    }
  print('printing menu');
  print(answer);

  return answer;
}
