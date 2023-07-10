import 'package:flutter/material.dart';
import 'package:elibrary/models/book.dart';
import 'package:elibrary/services/book_services.dart';

class BookProvider with ChangeNotifier {
  bool isLoading = true;
  List<Book> books = [];
  BookProvider({required context}) {
    fetchBooks(context);
  }

  void fetchBooks(context) async {
    books = await BooksServices().fetchBooks(context);
    isLoading = false;
    notifyListeners();
  }

  void addBook({required Book book}) {
    books.add(book);
    notifyListeners();
  }

  void updateBook({required Book book}) {
    int indexOfBook;
    try {
      indexOfBook = books.indexOf(
          books.firstWhere((element) => element.bookCode == book.bookCode));
    } catch (e) {
      indexOfBook = -1;
    }
    if (indexOfBook != -1) {
      books.removeAt(indexOfBook);
      books.add(book);
      notifyListeners();
    }
  }

  bool? getBook(String bookCode) {
    int indexOfBook;
    try {
      indexOfBook = books
          .indexOf(books.firstWhere((element) => element.bookCode == bookCode));
    } catch (e) {
      indexOfBook = -1;
    }
    if (indexOfBook != -1) {
      return true;
    }
    return false;
  }

  void deleteBook({required context, required String bookCode}) {
    int indexOfBook;
    try {
      indexOfBook = books
          .indexOf(books.firstWhere((element) => element.bookCode == bookCode));
    } catch (e) {
      indexOfBook = -1;
    }
    if (indexOfBook != -1) {
      books.removeAt(indexOfBook);
      notifyListeners();
    }
  }
}
