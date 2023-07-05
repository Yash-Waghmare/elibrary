import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/models/transaction.dart';
import 'package:elibrary/providers/dashboard_provider.dart';
import 'package:elibrary/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/dashboard_tile.dart';
import '../widgets/history_tile.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isReady = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        isReady = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DashboardProvider dashboardProvider =
        Provider.of<DashboardProvider>(context);
    final recentTransaction = dashboardProvider.m['transactions'];

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
                  number:
                      isReady ? '${dashboardProvider.m['studentCount']}' : '--',
                  title: 'Student Registered',
                ),
                DashBoardTile(
                  number:
                      isReady ? '${dashboardProvider.m['bookCount']}' : '--',
                  title: 'Book Registered',
                ),
                DashBoardTile(
                  number: isReady
                      ? '${dashboardProvider.m['transactionCount']}'
                      : '--',
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
                  isReady
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: dashboardProvider.transactions.length,
                              itemBuilder: ((context, i) {
                                return HistoryTile(
                                    id: dashboardProvider
                                        .transactions[i].transactionId!,
                                    name: dashboardProvider
                                        .transactions[i].studentName!,
                                    bDate: dashboardProvider
                                        .transactions[i].borrowedDate!,
                                    rDate: dashboardProvider
                                        .transactions[i].returnedDate!);
                              })))
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
