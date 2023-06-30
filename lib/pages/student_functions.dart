import 'package:flutter/material.dart';
import '../widgets/hero_dialogue_route.dart';
import '../widgets/popup_textfield.dart';
import '../widgets/popup_window.dart';

class StudentFunctions {
  AddStudent({
          required BuildContext context,
          required TextEditingController nameController,
          required TextEditingController contactNumberController,
          required TextEditingController emailController}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            height: MediaQuery.of(context).size.width * 0.34,
            width: MediaQuery.of(context).size.width * 0.25,
            title: 'Add Student',
            buttonText: 'Add',
            function: () {
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

  UpdateStudent(
  {required BuildContext context,
    required TextEditingController idController,
    required TextEditingController nameController,
    required TextEditingController contactNumberController,
    required TextEditingController emailController}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            height: MediaQuery.of(context).size.width * 0.34,
            width: MediaQuery.of(context).size.width * 0.25,
            title: 'Update Student',
            buttonText: 'Update',
            function: () {
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
  RemoveStudent(
      {required BuildContext context,
        required TextEditingController idController,
        required TextEditingController adminPasswordController}) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            height: MediaQuery.of(context).size.width * 0.34,
            width: MediaQuery.of(context).size.width * 0.25,
            title: 'Remove Student',
            buttonText: 'Remove',
            function: () {
              idController.clear();
              adminPasswordController.clear();
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
  ShowStudent(
      {required BuildContext context,
        required TextEditingController idController,
        required TextEditingController nameController,
        required TextEditingController contactNumberController,
        required TextEditingController emailController,
        required TextEditingController succesfulTransactionController,
        required TextEditingController unReturnedBooksController      }) =>
      {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return PopUpFrame(
            height: MediaQuery.of(context).size.width * 0.34,
            width: MediaQuery.of(context).size.width * 0.30,
            title: 'Student Details',
            isButtonNeeded: false,
            buttonText: 'Cancel',
            function: () {
              idController.clear();
              nameController.clear();
              contactNumberController.clear();
              emailController.clear();
              succesfulTransactionController.clear();
              unReturnedBooksController.clear();
              Navigator.pop(context);
            },
            children: [
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: idController,
                hintText: idController.text,
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: nameController,
                hintText: nameController.text,
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: contactNumberController,
                hintText: contactNumberController.text,
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: emailController,
                hintText: emailController.text,
                readOnly: true,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: succesfulTransactionController,
                readOnly: true,
                hintText: succesfulTransactionController.text,
              ),
              SizedBox(
                height: 10,
              ),
              PopUpTextfield(
                controller: unReturnedBooksController,
                hintText: unReturnedBooksController.text,
                readOnly: true,
              ),
            ],
          );
        }))
      };
}
