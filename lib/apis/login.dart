import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = 'https://odd-plum-clam-cuff.cyclic.app/';

Future<void> createShopkeeper(
    String phoneNumber,
    String email,
    String name,
    String businessName,
    String businessType,
    String location,
    int closeTime,
    int openTime,
    List<String> photos,
    String description,
    String uid) async {
  final body = jsonEncode({
    "phoneNumber": phoneNumber,
    "email": email,
    "name": name,
    "businessName": businessName,
    "businessType": businessType,
    "location": location,
    "openTime": openTime,
    "closeTime": closeTime,
    "photos": photos,
    "description": description,
    "uid": uid
  });

  final response = await http.post(Uri.parse('${baseUrl}api/shopkeeper'),
      body: body, headers: {'content-type': 'application/json'});

  print(response.body);
}

Future<void> createCustomer(String phoneNumber, String name, String uid) async {
  final body = jsonEncode({
    "phoneNumber": phoneNumber,
    "name": name,
    "uid": uid,
  });

  final response = await http.post(Uri.parse('${baseUrl}api/customer'),
      body: body, headers: {'content-type': 'application/json'});

  print(response.body);
}
