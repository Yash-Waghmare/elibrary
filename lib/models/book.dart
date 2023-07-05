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
