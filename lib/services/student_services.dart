import 'dart:convert';
import 'dart:math';
import 'package:elibrary/providers/student_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../constant/handler.dart';
import '../constant/url_constants.dart';
import '../models/student.dart';

class StudentsService {
  Future<List<Student>> fetchStudents(context) async {
    List<Student> students = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/student'), headers: <String, String>{
        'api_key': "123456",
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
        'authorization': 'bearer sarvesh@gmail.com'
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['students'];
            Student newStudent;
            decode.forEach((map) => {
                  newStudent = Student.fromJson(map),
                  students.add(newStudent),
                });
          });
      return students;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return [];
    }
  }

  Future<bool> addStudent({
    required BuildContext context,
    required String studentName,
    required String email,
    required String contactNumber,
  }) async {
    try {
      http.Response res =
          await http.post(Uri.parse('$uri/student'), headers: <String, String>{
        'api_key': "123456",
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
        'authorization': 'bearer sarvesh@gmail.com',
      }, body: {
        "studentName": studentName,
        "email": email,
        "contactNumber": contactNumber
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['student'];
            Student newStudent = Student.fromJson(decode);
            Provider.of<StudentProvider>(context, listen: false)
                .createStudent(student: newStudent);
          });
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> updateStudent({
    required BuildContext context,
    required String studentId,
    required String studentName,
    required String email,
    required String contactNumber,
  }) async {
    try {
      http.Response res =
          await http.put(Uri.parse('$uri/student'), headers: <String, String>{
        'api_key': "123456",
        'token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
        'authorization': 'bearer sarvesh@gmail.com',
      }, body: {
        "id": studentId,
        "studentName": studentName,
        "email": email,
        "contactNumber": contactNumber
      });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            var decode = jsonDecode(res.body)['student'];
            Student newStudent = Student.fromJson(decode);
            Provider.of<StudentProvider>(context, listen: false)
                .updateStudent(context: context, student: newStudent);
          });
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> removeStudent(
      {required BuildContext context,
      required String studentId,
      required String adminPassword}) async {
    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/student?id=$studentId&password=$adminPassword'),
        headers: <String, String>{
          'api_key': "123456",
          'token':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhcnZlc2hAZ21haWwuY29tIiwiaWF0IjoxNjg2MzE2Mzc3LCJleHAiOjE2OTQ5NTYzNzd9.kwwdtXh03r8oXj8lPz1kP2fhtUgcmZZ_Hc6Nm52_9RY',
          'authorization': 'bearer sarvesh@gmail.com',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Provider.of<StudentProvider>(context, listen: false)
                .deleteStudent(context: context, id: studentId);
          });
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
