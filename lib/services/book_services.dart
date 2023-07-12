import 'package:elibrary/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/handler.dart';
import '../constant/url_constants.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:elibrary/providers/book_provider.dart';

// This file contains the book services
// The services are:
// 1. Fetch books: Fetches all the books from the database
// 2. Add book: Adds a new book to the database
// 3. Update book: Updates the book details (the quantity of the book is updated).
// 4. Delete book: Deletes the book from the database

// The book service is used by the book provider

class BooksServices {
  Future<List<Book>> fetchBooks(context) async {
    List<Book> books = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';

    try {
      http.Response res = await http.get(Uri.parse('$uri/book'),
          headers: <String, String>{
            'api_key': "123456",
            'token': token,
            'authorization': 'bearer $adminEmail'
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['books'];
            Book newBook;
            decode.forEach((map) => {
                  newBook = Book.fromJson(map),
                  books.add(newBook),
                });
          });
      // log(books.length.toString());
      return books;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }
// TODO: Bug in book addition while adding book with same book code as previous one

  Future<bool> addBook(
      {required context,
      required String bookCode,
      required String bookName,
      required String bookAuthor,
      required String bookImage,
      required String description,
      required String quantity}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';
    try {
      http.Response res =
          await http.post(Uri.parse('$uri/book'), headers: <String, String>{
        'api_key': "123456",
        'token': token,
        'authorization': 'bearer $adminEmail',
      }, body: {
        "bookCode": bookCode,
        "bookName": bookName,
        "bookImage": bookImage,
        "bookAuthor": bookAuthor,
        "description": description,
        "quantity": quantity
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['book'];
            Book newBook = Book.fromJson(decode);
            Provider.of<BookProvider>(context, listen: false)
                .addBook(book: newBook);
          });
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> updateBook(
      {required context,
      required String bookCode,
      required String quantity}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';
    try {
      http.Response res = await http.put(
          Uri.parse('$uri/book?bookCode=$bookCode&quantity=$quantity'),
          headers: <String, String>{
            'api_key': "123456",
            'token': token,
            'authorization': 'bearer $adminEmail',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['book'];
            Book newBook = Book.fromJson(decode);
            Provider.of<BookProvider>(context, listen: false)
                .updateBook(book: newBook);
          });
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> removeBook(
      {required context,
      required String bookCode,
      required String adminPassword}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '',
        adminEmail = prefs.getString('adminEmail') ?? '';

    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/book?bookCode=$bookCode&password=$adminPassword'),
        headers: <String, String>{
          'api_key': "123456",
          'token': token,
          'authorization': 'bearer $adminEmail',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Provider.of<BookProvider>(context, listen: false)
                .deleteBook(context: context, bookCode: bookCode);
          });
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
