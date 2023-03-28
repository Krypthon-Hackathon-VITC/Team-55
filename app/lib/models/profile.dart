// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    this.name,
    this.phoneNumber,
    this.fcmToken,
    this.firebaseId,
    this.dob,
    this.gender,
    this.height,
    this.weight,
  });

  String? name;
  int? phoneNumber;
  String? fcmToken;
  String? firebaseId;
  DateTime? dob;
  String? gender;
  String? height;
  String? weight;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        name: json["name"],
        phoneNumber: json["phone_number"],
        fcmToken: json["fcm_token"],
        firebaseId: json["firebase_id"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "fcm_token": fcmToken,
        "firebase_id": firebaseId,
        "dob": dob?.toIso8601String(),
        "gender": gender,
        "height": height,
        "weight": weight,
      };
}
