import 'package:elibrary/providers/student_provider.dart';
import 'package:elibrary/function/student_functions.dart';
import 'package:elibrary/services/student_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
import '../models/student.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/student_details_tile.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  TextEditingController idController = TextEditingController(),
      nameController = TextEditingController(),
      contactNumberController = TextEditingController(),
      emailController = TextEditingController(),
      adminPasswordController = TextEditingController(),
      succesfulTransactionController = TextEditingController(),
      unReturnedBooksController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StudentProvider studentProvider = Provider.of<StudentProvider>(context);
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
                  hintText: 'Enter Student ID',
                  onSubmit: (val) {
                    Student? student = studentProvider.getStudent(val);
                    if (student != null) {
                      idController.text = student!.id!;
                      nameController.text = student!.studentName!;
                      emailController.text = student!.email!;
                      contactNumberController.text = student!.contactNumber!;
                      succesfulTransactionController.text =
                          student!.transactionCount!;
                      unReturnedBooksController.text =
                          student!.unreturnedBooks!;
                      StudentFunctions().ShowStudent(
                          context: context,
                          idController: idController,
                          nameController: nameController,
                          contactNumberController: contactNumberController,
                          emailController: emailController,
                          succesfulTransactionController:
                              succesfulTransactionController,
                          unReturnedBooksController: unReturnedBooksController);
                    }else{
                      idController.clear();
                    }
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
            if(studentProvider.students.length!=0)
              for (int i = 0; i < studentProvider.students.length; i++)
                StudentDetailsTile(
                  studentId: studentProvider.students[i].id,
                  studentName: studentProvider.students[i].studentName,
                  contactNumber: studentProvider.students[i].contactNumber,
                  emailId: studentProvider.students[i].email,
                  onTap: () {
                    idController.text = studentProvider.students[i].id!;
                    nameController.text =
                        studentProvider.students[i].studentName!;
                    contactNumberController.text =
                        studentProvider.students[i].contactNumber!;
                    emailController.text = studentProvider.students[i].email!;
                    succesfulTransactionController.text =
                        studentProvider.students[i].transactionCount!;
                    unReturnedBooksController.text =
                        studentProvider.students[i].unreturnedBooks!;
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
            studentProvider.students.length==0
                ? Center(
                    child: CircularProgressIndicator()
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

}
