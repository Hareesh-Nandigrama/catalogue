import 'package:catalogue/enums/enums.dart';

class Shopkeeper {
  final String phoneNumber;
  final String email;
  final String name;
  final String businessName;
  final businessTypes businessType;
  final locations location;
  final int openTime;
  final int closeTime;
  final List<String> photos;
  final String description;
  final String uid;
  final bool opeStatus;

  Shopkeeper(
      {required this.name,
      required this.phoneNumber,
      required this.businessName,
      required this.businessType,
      required this.closeTime,
      required this.description,
      required this.email,
      required this.location,
      required this.openTime,
      required this.photos,
      required this.uid,
      required this.opeStatus});


  Map<String, dynamic> toJson() {
    return {
      "phoneNumber": phoneNumber,
      "email": email,
      "name": name,
      "businessName": businessName,
      "businessType": businessType.name,
      "location": location.name,
      "openTime": openTime,
      "closeTime": closeTime,
      "photos": photos,
      "description": description,
      "uid": uid,
      "openStatus": opeStatus,
    };
  }
}
