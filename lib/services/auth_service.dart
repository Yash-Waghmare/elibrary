import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/handler.dart';
import '../constant/url_constants.dart';

class AuthService {
  Future<bool> loginAdmin({
    required BuildContext context,
    required String email,
    required String adminPassword,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/login?email=$email&password=$adminPassword'),
        headers: <String, String>{
          'api_key': "123456",
          'authorization': 'bearer $email',
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            String decode = jsonDecode(res.body)['token'];
            prefs.clear();
            prefs.setString('token', decode).then((value) => {
                  // print(prefs.getString('token')),
                  prefs.setString('adminEmail', email).then((value) => {
                        // print(prefs.getString('adminEmail')),
                      })
                });
          });
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> checkAdmin({
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';
    if (token == '') {
      return false;
    }
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/check'),
        headers: <String, String>{
          'api_key': "123456",
          'authorization': 'bearer $adminEmail',
          'token': token
        },
      );
      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            // bool decode = jsonDecode(res.body)['validToken'];
          });
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
