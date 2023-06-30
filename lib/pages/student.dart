import 'package:elibrary/pages/student_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/student_details_tile.dart';

class Student extends StatefulWidget {
  const Student({Key? key}) : super(key: key);

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController(),
        nameController = TextEditingController(),
        contactNumberController = TextEditingController(),
        emailController = TextEditingController(),
        adminPasswordController = TextEditingController(),
        succesfulTransactionController = TextEditingController(),
        unReturnedBooksController = TextEditingController();
    return Container(
      color: AppColors.colors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomButton(
                  buttonText: 'Add Student',
                  buttonColor: AppColors.colors.green,
                  textColor: AppColors.colors.black,
                  function: () {
                    StudentFunctions().AddStudent(
                        context: context,
                        nameController: nameController,
                        contactNumberController: contactNumberController,
                        emailController: emailController);
                  },
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomButton(
                  buttonText: 'Update Student',
                  buttonColor: AppColors.colors.yellow,
                  textColor: AppColors.colors.black,
                  function: () {
                    StudentFunctions().UpdateStudent(
                        context: context,
                        idController: idController,
                        nameController: nameController,
                        contactNumberController: contactNumberController,
                        emailController: emailController);
                  },
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomButton(
                  buttonText: 'Remove Student',
                  buttonColor: AppColors.colors.red,
                  textColor: AppColors.colors.black,
                  function: () {
                    StudentFunctions().RemoveStudent(
                      context: context,
                      idController: idController,
                      adminPasswordController: adminPasswordController,
                    );
                  },
                  height: 50,
                  width: 190,
                  fsize: 18,
                  fWeight: FontWeight.w600,
                ),
                CustomTextfield(
                  controller: idController,
                  hintText: 'Enter Transaction ID',
                  onSubmit: (val) {
                    idController.text = "2";
                    nameController.text = "asd";
                    emailController.text = "yash.waghmare20@pccoepune.org";
                    succesfulTransactionController.text = "20";
                    StudentFunctions().ShowStudent(
                        context: context,
                        idController: idController,
                        nameController: nameController,
                        contactNumberController: contactNumberController,
                        emailController: emailController,
                        succesfulTransactionController:
                            succesfulTransactionController,
                        unReturnedBooksController: unReturnedBooksController);
                  },
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Student ID',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Contact Number',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Email',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            StudentDetailsTile(
              studentId: "1",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
              onTap: () {},
            ),
            StudentDetailsTile(
              studentId: "2",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
              onTap: () {
                idController.text = "1";
                nameController.text = "asd";
                emailController.text = "Yash Gulabrao Waghmare20@pccoepune.org";
                succesfulTransactionController.text = "20";
                StudentFunctions().ShowStudent(
                    context: context,
                    idController: idController,
                    nameController: nameController,
                    contactNumberController: contactNumberController,
                    emailController: emailController,
                    succesfulTransactionController:
                        succesfulTransactionController,
                    unReturnedBooksController: unReturnedBooksController);
              },
            ),
            StudentDetailsTile(
              studentId: "3",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
              onTap: () {},
            ),
            StudentDetailsTile(
              studentId: "4",
              studentName: "Yash Waghmare",
              contactNumber: "1234567890",
              emailId: "yash.waghmare20@pccoepune.org",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
    ;
  }
}
