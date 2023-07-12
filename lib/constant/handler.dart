import 'dart:convert';
import 'package:elibrary/providers/homepage_provider.dart';
import 'package:elibrary/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// This file contains all the functions that are used to handle errors and show snackbar
// The functions are used in the services and providers to handle errors and show snackbar
// The functions are used as ErrorHandler.functionName

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
          context,
          jsonDecode(response.body)['message'] ??
              'You are not authorized to perform this action',
          true);
      break;
    case 404:
      showSnackBar(
          context,
          jsonDecode(response.body)['message'] ??
              'You are not authorized to perform this action',
          true);
      break;
    case 400:
      showSnackBar(context,
          jsonDecode(response.body)['message'] ?? "Something went wrong", true);
      if (jsonDecode(response.body)['message'] ==
          "Session Finished Please Login Again") {
        Provider.of<HomePageProvider>(context, listen: false).setIndex(0);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
      break;
    case 500:
      showSnackBar(context, 'Server error', true);
      break;
    default:
      showSnackBar(context, jsonDecode(response.body)['message'], true);
  }
}

void showSnackBar(BuildContext context, String text, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      elevation: 2,
      margin: const EdgeInsets.all(10),
    ),
  );
}
