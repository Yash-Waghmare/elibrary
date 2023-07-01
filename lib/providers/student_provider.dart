import 'package:elibrary/models/student.dart';
import 'package:elibrary/services/student_services.dart';
import 'package:flutter/cupertino.dart';

class StudentProvider with ChangeNotifier {
  List<Student> students = [];
  StudentProvider({required context}){
    fetchStudents(context);
  }
  void createStudent(Student student) {
    students.add(student);
    notifyListeners();
  }

  void fetchStudents(context) async {
    students =await StudentsService().fetchStudents(context);
    notifyListeners();
  }
  Student? getStudent(String id){
    for(int i=0;i<students.length;i++){
      if(students[i].id==id){
        return students[i];
      }
    }
    return null;
  }
  void updateStudent(Student student) {}
  // Student getStudent(){
  //
  // }
  //
  // Student deleteStudent(){
  //
  // }
}
