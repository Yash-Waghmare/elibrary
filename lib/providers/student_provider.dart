import 'package:elibrary/constant/handler.dart';
import 'package:elibrary/models/student.dart';
import 'package:elibrary/services/student_services.dart';
import 'package:flutter/cupertino.dart';

class StudentProvider with ChangeNotifier {
  List<Student> students = [];
  StudentProvider({required context}) {
    fetchStudents(context);
  }
  void createStudent({required Student student}) async {
    students.add(student);
    notifyListeners();
  }

  void fetchStudents(context) async {
    students = await StudentsService().fetchStudents(context);
    notifyListeners();
  }

  Student? getStudent(String id) {
    int indexOfStudent;
    try {
      indexOfStudent =
          students.indexOf(students.firstWhere((element) => element.id == id));
    } catch (e) {
      indexOfStudent = -1;
    }
    if (indexOfStudent != -1) {
      return students[indexOfStudent];
    }
    return null;
  }

  void updateStudent({required context, required Student student}) {
    int indexOfStudent;
    try {
      indexOfStudent = students
          .indexOf(students.firstWhere((element) => element.id == student.id));
    } catch (e) {
      indexOfStudent = -1;
    }
    if (indexOfStudent != -1) {
      students.removeAt(indexOfStudent);
      students.add(student);
      notifyListeners();
    }
  }

  void deleteStudent({required context, required String id}) {
    int indexOfStudent;
    try {
      indexOfStudent =
          students.indexOf(students.firstWhere((element) => element.id == id));
    } catch (e) {
      indexOfStudent = -1;
    }
    if (indexOfStudent != -1) {
      students.removeAt(indexOfStudent);
      notifyListeners();
    }
  }
}
