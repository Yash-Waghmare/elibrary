class Transaction {
  String? transactionId;
  String? bookCode;
  String? bookName;
  String? studentId;
  String? studentName;
  String? status;
  String? borrowedDate;
  String? returnedDate;

  Transaction(
      {this.transactionId,
      this.bookCode,
      this.bookName,
      this.studentId,
      this.studentName,
      this.status,
      this.borrowedDate,
      this.returnedDate});

  factory Transaction.fromJson(Map<dynamic, dynamic> map) {
    return Transaction(
        transactionId: map['transactionId'],
        bookCode: map['bookCode'],
        bookName: map['bookName'],
        studentId: map['studentId'],
        studentName: map['studentName'],
        status: map['status'],
        borrowedDate: map['borrowedDate'],
        returnedDate: map['returnedDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      "transactionId": transactionId,
      "bookCode": bookCode,
      "bookName": bookName,
      "studentId": studentId,
      "studentName": studentName,
      "status": status,
      "borrowedDate": borrowedDate,
      "returnedDate": returnedDate
    };
  }

  Transaction copyWith({
    String? transactionId,
    String? bookCode,
    String? bookName,
    String? studentId,
    String? studentName,
    String? status,
    String? borrowedDate,
    String? returnedDate,
  }) {
    return Transaction(
        transactionId: transactionId ?? this.transactionId,
        bookCode: bookCode ?? this.bookCode,
        bookName: bookName ?? this.bookName,
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        status: status ?? this.status,
        borrowedDate: borrowedDate ?? this.borrowedDate,
        returnedDate: returnedDate ?? this.returnedDate);
  }
}
