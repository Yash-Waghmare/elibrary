import 'package:elibrary/models/student.dart';
import 'package:elibrary/services/student_services.dart';
import 'package:flutter/cupertino.dart';

// StudentProvider is used to store the list of students in the app
// The functions are:
// 1. fetchStudents() - This function is used to fetch the list of students from the database
// 2. createStudent() - This function is used to add a student to the list of students
// 3. updateStudent() - This function is used to update a student in the list of students
// 4. getStudent() - This function is used to get a student from the list of students
// 5. deleteStudent() - This function is used to remove a student from the list of students
class StudentProvider with ChangeNotifier {
  List<Student> students = [];
  bool isLoding = true;
  StudentProvider({required context}) {
    fetchStudents(context);
  }
  void createStudent({required Student student}) async {
    students.add(student);
    notifyListeners();
  }

  void fetchStudents(context) async {
    students = await StudentsService().fetchStudents(context);
    isLoding=false;
    notifyListeners();
  }

  bool? getStudent(String id) {
    int indexOfStudent;
    try {
      indexOfStudent =
          students.indexOf(students.firstWhere((element) => element.id == id));
    } catch (e) {
      indexOfStudent = -1;
    }
    if (indexOfStudent != -1) {
      return true;
    }
    return false;
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
