import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 403:
      showSnackBar(
          context, jsonDecode(response.body)['message']??'You are not authorized to perform this action', true);
      break;
    case 404:
      showSnackBar(
          context, jsonDecode(response.body)['message']??'You are not authorized to perform this action', true);
      break;
    case 400:
      showSnackBar(context,
          jsonDecode(response.body)['message'] ?? "Something went wrong", true);
      break;
    case 500:
      showSnackBar(context, 'Server error', true);
      break;
    default:
      showSnackBar(context, jsonDecode(response.body)['message'] , true);
  }
}
void showSnackBar(BuildContext context, String text, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      elevation: 2,
      margin: const EdgeInsets.all(10),
    ),
  );
}