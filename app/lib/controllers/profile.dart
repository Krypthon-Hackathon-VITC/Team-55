import 'dart:convert';

import 'package:app/constants.dart';
import 'package:app/models/profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProfileController {
  Future postCustomer(_user) async {
    try {
      var response = await Dio().post(APIBase + APICustomer,
          data: _user,
          options: Options(headers: {'accept': 'application/json'}));
      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
