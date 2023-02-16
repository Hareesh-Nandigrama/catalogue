import 'package:http/http.dart' as http;

Future<void> getShopkeeper() async {
  final response = await http.post(
      Uri.parse('https://odd-plum-clam-cuff.cyclic.app/api/shopkeeper'),
      headers: {"Authorization": "Token qwerty"});

  print(response.body);
}
