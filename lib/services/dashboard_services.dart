import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/handler.dart';
import '../constant/url_constants.dart';

// This file contains the dashboard services
// This service contians the fetch data function for the dashboard
// This service fetches:
// 1. Total number of books
// 2. Total number of users
// 3. Total number of transactions
// 4. Recent transactions
class DashboardServices {
  Future<Map<String, dynamic>> fetchData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';

    try {
      http.Response res = await http.get(Uri.parse('$uri/dashboard'),
          headers: <String, String>{
            'api_key': "123456",
            'token': token,
            'authorization': 'bearer $adminEmail'
          });
      httpErrorHandle(response: res, context: context, onSuccess: () {});
      return Map<String, dynamic>.from(jsonDecode(res.body));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return {};
    }
  }
}
