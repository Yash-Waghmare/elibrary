import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
              child: Text('Library Dashboard',
                  style: GoogleFonts.inter(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DashBoardTile(
                  number: '40',
                  title: 'Student Registered',
                ),
                DashBoardTile(
                  number: '20',
                  title: 'Book Registered',
                ),
                DashBoardTile(
                  number: '4000',
                  title: 'Total Transactions',
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.43,
              margin: EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                  color: AppColors.colors.tileBackground,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Text(
                      'Recent Transactions',
                      style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Transaction ID   ',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '      Name      ',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ' Borrowed Date',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Returned Date',
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  HistoryTile(
                    bDate: '26/06/2023',
                    id: '5',
                    name: 'Yash Gulabrao Waghmare',
                    rDate: '',
                  ),
                  HistoryTile(
                    bDate: '26/06/2023',
                    id: '4',
                    name: 'Lomesh Rajendra Wagh',
                    rDate: '',
                  ),
                  HistoryTile(
                    bDate: '26/06/2023',
                    id: '3',
                    name: 'Lomesh Rajendra Wagh',
                    rDate: '',
                  ),
                  HistoryTile(
                    bDate: '26/06/2023',
                    id: '2',
                    name: 'Sarvesh Bapusaheb Chavan',
                    rDate: '28/06/2023',
                  ),
                  HistoryTile(
                    bDate: '26/06/2023',
                    id: '1',
                    name: 'Dattatraya Abhijit Suryawanshi',
                    rDate: '28/06/2023',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    super.key,
    required this.id,
    required this.name,
    required this.bDate,
    required this.rDate,
  });
  final String id, name, bDate, rDate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 70, right: 40),
            width: 50,
            child: Text(
              id,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 275,
            child: Text(
              name,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            width: 100,
            alignment: Alignment.center,
            child: Text(
              bDate,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 80),
            width: 100,
            child: Text(
              rDate.isNotEmpty ? rDate : '    -    ',
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.colors.faintText,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class DashBoardTile extends StatelessWidget {
  const DashBoardTile({
    super.key,
    required this.title,
    required this.number,
  });
  final String title, number;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
        color: AppColors.colors.tileBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27),
              child: Text(
                title,
                style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  buttonText: 'See More',
                  buttonColor: AppColors.colors.buttonBackground,
                  function: () {},
                  height: 25,
                  width: 100,
                  fsize: 14,
                  textColor: Colors.white,
                ),
                Text(
                  number,
                  style: GoogleFonts.inter(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ]),
    );
  }
}
