// This file contains the Book model.
// The Book model is used to store the details of a book.
// The Book model is used in the book provider.
// This Book model is used to convert the map to json and vice versa.

class Book {
  String? bookCode;
  String? bookName;
  String? bookImage;
  String? bookAuthor;
  String? description;
  String? quantity;

  Book({
    this.bookCode,
    this.bookName,
    this.bookImage,
    this.bookAuthor,
    this.description,
    this.quantity,
  });

  factory Book.fromJson(Map<dynamic, dynamic> map) {
    return Book(
      bookCode: map['bookCode'],
      bookName: map['bookName'],
      bookImage: map['bookImage'],
      bookAuthor: map['bookAuthor'],
      description: map['description'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "bookCode": bookCode,
      "bookName": bookName,
      "authorImage": bookImage,
      "bookAuthor": bookAuthor,
      "description": description,
      "quantity": quantity,
    };
  }
}
