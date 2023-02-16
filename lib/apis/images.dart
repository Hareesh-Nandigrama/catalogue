import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> uploadImage(File file) async {
  String privateKey = 'private_3uXXYBIXEeahWB5iO818Z6SYguQ=';
  String pass = 'Gogoagone1234';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$privateKey:$pass'))}';

  var req = http.MultipartRequest(
      "POST", Uri.parse('https://upload.imagekit.io/api/v1/files/upload'));

  req.fields['fileName'] = 'Image1';
  req.headers['Authorization'] = basicAuth;

  req.fields['file'] = base64Encode(await file.readAsBytes());
  var response = await req.send();

  var responseData = await response.stream.toBytes();

  final result = String.fromCharCodes(responseData);
  Map<String, dynamic> jsonResult = jsonDecode(result);

  return jsonResult['url'];
}
