// To parse this JSON data, do
//
//     final scannerModel = scannerModelFromJson(jsonString);

import 'dart:convert';

ScannerModel scannerModelFromJson(String str) =>
    ScannerModel.fromJson(json.decode(str));

String scannerModelToJson(ScannerModel data) => json.encode(data.toJson());

class ScannerModel {
  ScannerModel({
    this.name,
    this.indication,
  });

  String? name;
  String? indication;

  factory ScannerModel.fromJson(Map<String, dynamic> json) => ScannerModel(
        name: json["Name"],
        indication: json["Indication"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Indication": indication,
      };
}
