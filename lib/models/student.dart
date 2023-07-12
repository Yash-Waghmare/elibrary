// This file conatins the Student model.
// The Student model is used to store the details of a student.
// The Student model is used in the student provider.
// This Student model is used to convert the map to json and vice versa.

class Student {
  String? id;
  String? studentName;
  String? email;
  String? contactNumber;
  String? transactionCount;
  String? unreturnedBooks;

  Student({
    this.id,
    this.studentName,
    this.email,
    this.contactNumber,
    this.transactionCount,
    this.unreturnedBooks,
  });

  factory Student.fromJson(Map<dynamic, dynamic> map) {
    return Student(
      id: map['id'],
      email: map['email'],
      studentName: map['studentName'],
      contactNumber: map['contactNumber'],
      transactionCount: map['transactionCount'],
      unreturnedBooks: map['unreturnedBooks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "studentName": studentName,
      "contactNumber": contactNumber,
      "transactionCount": transactionCount,
      "unreturnedBooks": unreturnedBooks,
    };
  }

  Student copyWith(
      {String? id,
      String? userName,
      String? email,
      String? contactNumber,
      String? transactionCount,
      String? unReturnedBooks}) {
    return Student(
      id: id ?? this.id,
      email: email ?? this.email,
      studentName: userName ?? studentName,
      contactNumber: contactNumber ?? this.contactNumber,
      transactionCount: transactionCount ?? this.transactionCount,
      unreturnedBooks: unReturnedBooks ?? unreturnedBooks,
    );
  }
}
