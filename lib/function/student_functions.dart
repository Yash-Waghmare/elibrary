import 'package:flutter/material.dart';
import '../constant/handler.dart';
import '../services/student_services.dart';
import '../widgets/hero_dialogue_route.dart';
import '../widgets/popup_textfield.dart';
import '../widgets/popup_window.dart';

class StudentFunctions {
  addStudent(
          {required BuildContext context,
          required TextEditingController nameController,
          required TextEditingController contactNumberController,
          required TextEditingController emailController}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            width: MediaQuery.of(context).size.width * 0.25,
            title: 'Add Student',
            buttonText: 'Add',
            function: () async {
              bool result = await StudentsService().addStudent(
                context: context,
                studentName: nameController.text,
                email: emailController.text,
                contactNumber: contactNumberController.text,
              );
              result == false
                  ? showSnackBar(context, "Unable to add student", true)
                  : showSnackBar(context, "Student Added", false);

              nameController.clear();
              emailController.clear();
              contactNumberController.clear();
              Navigator.pop(context);
            },
            children: [
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: nameController,
                hintText: 'Name',
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: contactNumberController,
                hintText: 'Contact Number',
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: emailController,
                hintText: 'Email',
              ),
            ],
          );
        }))
      };

  updateStudent(
          {required BuildContext context,
          required TextEditingController idController,
          required TextEditingController nameController,
          required TextEditingController contactNumberController,
          required TextEditingController emailController}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            width: MediaQuery.of(context).size.width * 0.25,
            title: 'Update Student',
            buttonText: 'Update',
            function: () async {
              bool result = await StudentsService().updateStudent(
                  context: context,
                  studentId: idController.text,
                  studentName: nameController.text,
                  email: emailController.text,
                  contactNumber: contactNumberController.text);
              result == false
                  ? showSnackBar(context, "Unable to update student", true)
                  : showSnackBar(context, 'Student Updated', false);
              idController.clear();
              nameController.clear();
              emailController.clear();
              contactNumberController.clear();
              Navigator.pop(context);
            },
            children: [
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: idController,
                hintText: 'Id',
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: nameController,
                hintText: 'Name',
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: contactNumberController,
                hintText: 'Contact Number',
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: emailController,
                hintText: 'Email',
              ),
            ],
          );
        }))
      };
  removeStudent(
          {required BuildContext context,
          required TextEditingController idController,
          required TextEditingController adminPasswordController}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            width: MediaQuery.of(context).size.width * 0.25,
            title: 'Remove Student',
            buttonText: 'Remove',
            function: () async {
              bool result = await StudentsService().removeStudent(
                  context: context,
                  studentId: idController.text,
                  adminPassword: adminPasswordController.text);
              idController.clear();
              adminPasswordController.clear();
              if (result == true) {
                showSnackBar(context, 'Student Removed', false);
              }
              Navigator.pop(context);
            },
            children: [
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: idController,
                hintText: 'Id',
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: adminPasswordController,
                hintText: 'Admin Password',
              ),
            ],
          );
        }))
      };
  showStudent(
          {required BuildContext context,
          required String studentId,
          required String studentName,
          required String contactNumber,
          required String email,
          required String succesfulTransaction,
          required String unReturnedBooks}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            width: MediaQuery.of(context).size.width * 0.30,
            title: 'Student Details',
            isButtonNeeded: false,
            buttonText: 'Cancel',
            function: () {
              Navigator.pop(context);
            },
            children: [
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Student Id: $studentId',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Student Name: $studentName',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Phone No: $contactNumber',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Email: $email',
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                readOnly: true,
                hintText: 'Succesful Transactions: $succesfulTransaction',
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: TextEditingController(),
                hintText: 'Un-Returned Books: $unReturnedBooks',
                readOnly: true,
              ),
            ],
          );
        }))
      };
}
