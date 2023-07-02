import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/dashboard_tile.dart';
import '../widgets/history_tile.dart';

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
