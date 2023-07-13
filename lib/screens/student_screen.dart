import 'package:elibrary/constant/handler.dart';
import 'package:elibrary/providers/student_provider.dart';
import 'package:elibrary/function/student_functions.dart';
import 'package:elibrary/widgets/skeleton_tile_student.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constant/colors.dart';
import '../constant/theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/student_details_tile.dart';

// StudentScreen is used to display the list of students in the app
// Student Screen contains the functionality of:
// 1. Adding a student
// 2. Updating a student
// 3. Deleting a student
// 4. Searching a student
// 5. Refreshing the list of students
// 6. Displaying the list of students

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
      adminPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  String showList = '';

  @override
  Widget build(BuildContext context) {
    StudentProvider studentProvider = Provider.of<StudentProvider>(context);
    final filterStudent = studentProvider.students.where(
      (element) {
        return element.id == showList || showList.isEmpty;
      },
    ).toList();
    return Container(
      color: AppColors.colors.background,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    showList = '';
                    studentProvider.isLoding = true;
                    studentProvider.students = [];
                    studentProvider.fetchStudents(context);
                  });
                },
                icon: Icon(
                  Icons.refresh_outlined,
                  size: 35,
                  color: AppColors.colors.blue,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      buttonText: 'Add Student',
                      buttonColor: AppColors.colors.green,
                      textColor: AppColors.colors.black,
                      function: () {
                        setState(() {
                          showList = '';
                          idController.clear();
                        });
                        StudentFunctions().addStudent(
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
                        setState(() {
                          showList = '';
                          idController.clear();
                        });
                        StudentFunctions().updateStudent(
                            context: context,
                            idController: idController,
                            nameController: nameController,
                            contactNumberController: contactNumberController);
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
                        setState(() {
                          showList = '';
                          idController.clear();
                        });
                        StudentFunctions().removeStudent(
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
                        setState(() {
                          if (val.isNotEmpty) {
                            bool? valid = studentProvider.getStudent(val);
                            if (valid!) {
                              showList = val;
                            } else {
                              showList = '';
                              showSnackBar(
                                  context, 'Student Id Not Found', true);
                              idController.clear();
                            }
                          } else {
                            showList = '';
                          }
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
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
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: studentProvider.isLoding == false
                        ? filterStudent.isNotEmpty
                            ? ListView.builder(
                                itemCount: filterStudent.length,
                                itemBuilder: ((context, i) {
                                  return StudentDetailsTile(
                                    studentId: filterStudent[i].id,
                                    studentName: filterStudent[i].studentName,
                                    contactNumber:
                                        filterStudent[i].contactNumber,
                                    emailId: filterStudent[i].email,
                                    onTap: () {
                                      StudentFunctions().showStudent(
                                        context: context,
                                        studentId: filterStudent[i].id!,
                                        studentName:
                                            filterStudent[i].studentName!,
                                        contactNumber:
                                            filterStudent[i].contactNumber!,
                                        email: filterStudent[i].email!,
                                        succesfulTransaction:
                                            filterStudent[i].transactionCount!,
                                        unReturnedBooks:
                                            filterStudent[i].unreturnedBooks!,
                                      );
                                    },
                                  );
                                }))
                            : Center(
                                child: Text('Students Not Found',
                                    style: appTheme()
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: AppColors.colors.white,
                                        )))
                        : ListView.builder(
                            itemCount: 7,
                            itemBuilder: ((context, i) {
                              return const SkeletonTile();
                            }),
                          )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
