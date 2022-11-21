import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:com.petroimensharif.pishco/data/network/constants/endpoints.dart';
import 'package:com.petroimensharif.pishco/domain/models/login/login_request.dart';
import 'package:com.petroimensharif.pishco/domain/models/login/login_response.dart';
import '../../dio_client.dart';
import 'dart:developer';

class UsersApi {
  // dio instance
  final DioClient? _dioClient;

  // injecting dio instance
  UsersApi(this._dioClient);

  // Generate an SMS for a registered user
  Future<LoginResponse?> loginUser(LoginRequest request) async {
    try {
      // final res = await _dioClient!.post(
      //     "${Endpoints.login}?email=${request.email}&password=${request.password}");
      //.........................................
      // Future<void> readJson() async {
        final String response = await rootBundle.loadString('assets/json_/data.json');
         var res = await json.decode(response);
        log('response, $res');
      // }
      //..........................................

      if (res != null) {
        return LoginResponse.fromJson(res);
      } else {
        return LoginResponse();
      }
    } catch (e, s) {
      if (kDebugMode) {
        print("registerUser $e $s");
      }
      Future.error(e);
    }
  }
}
