import 'package:elibrary/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../constant/colors.dart';

// Fine is used to calculate the fine of a student
// It contains the functionality of:
// 1. Calculating the fine of a student
// 2. Displaying the fine of a student

class Fine extends StatefulWidget {
  const Fine({Key? key}) : super(key: key);

  @override
  State<Fine> createState() => _FineState();
}

class _FineState extends State<Fine> {
  String startDate = '', endDate = '';
  DateTime startDateD = DateTime.now(), endDateD = DateTime.now();
  bool isRestricted = false;
  int fineDays = 0, fine = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colors.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text('Calculate Fine',
                  style: GoogleFonts.inter(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 400,
              margin: const EdgeInsets.only(left: 150, right: 370),
              padding: const EdgeInsets.only(left: 40, top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.colors.yellow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    buttonText: startDate != ''
                        ? startDate.toString()
                        : 'Select Borrowed Date',
                    buttonColor: AppColors.colors.blue,
                    textColor: AppColors.colors.black,
                    function: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate:
                              startDate == '' ? DateTime.now() : startDateD,
                          firstDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDate: DateTime.now());
                      if (pickedDate != null) {
                        setState(() {
                          startDateD = pickedDate;
                          String dateformat =
                              DateFormat('dd-MM-yyyy').format(pickedDate);
                          // print(dateformat);
                          startDate = dateformat;
                        });
                      }
                    },
                    fsize: 18,
                    height: 50,
                    fWeight: FontWeight.w500,
                    width: 300,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    buttonText: endDate != ''
                        ? endDate.toString()
                        : 'Select Returned Date',
                    buttonColor: AppColors.colors.blue,
                    textColor: AppColors.colors.black,
                    needCursor: startDate == '' ? false : true,
                    function: startDate == ''
                        ? () {}
                        : () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: endDate == ''
                                    ? startDateD.add(const Duration(days: 1))
                                    : endDateD,
                                firstDate:
                                    startDateD.add(const Duration(days: 1)),
                                lastDate:
                                    startDateD.add(const Duration(days: 365)));
                            if (pickedDate != null) {
                              setState(() {
                                endDateD = pickedDate;
                                String dateformat =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                // print(dateformat);
                                endDate = dateformat;
                                isRestricted = true;
                              });
                            }
                          },
                    fsize: 18,
                    height: 50,
                    fWeight: FontWeight.w500,
                    width: 300,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    buttonText: 'Calculate',
                    buttonColor: AppColors.colors.red,
                    textColor: AppColors.colors.black,
                    needCursor: isRestricted,
                    function: isRestricted
                        ? () {
                            fineDays =
                                endDateD.difference(startDateD).inDays + 1;
                            if (fineDays < 16) {
                              setState(() {
                                fine = -5;
                              });
                            } else if (fineDays < 31) {
                              setState(() {
                                fine = (fineDays - 15) * 10;
                              });
                            } else {
                              setState(() {
                                fine = ((fineDays - 30) * 25) + (15 * 10);
                              });
                            }
                          }
                        : () {},
                    height: 50,
                    width: 170,
                    fsize: 18,
                    fWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  fine == 0
                      ? const SizedBox()
                      : Row(
                          children: [
                            Text(
                              'Total days passed = ',
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: AppColors.colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              fineDays.toString(),
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: AppColors.colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                  const SizedBox(height: 10),
                  fine == 0
                      ? const SizedBox()
                      : Row(
                          children: [
                            Text(
                              'Fine Amount Is = ',
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: AppColors.colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              fine < 0 ? '0' : fine.toString(),
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: AppColors.colors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
