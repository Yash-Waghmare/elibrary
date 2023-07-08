import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/homepage_provider.dart';
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
    // dashboard provider for managing the state of dash board widget
    DashboardProvider dashboardProvider =
        Provider.of<DashboardProvider>(context);
    // homepage provider for using the variables on homepage
    HomePageProvider homepageProvider = Provider.of<HomePageProvider>(context);
    return Container(
      color: AppColors.colors.background,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
          // refresh button is used to refresh the dashboard page
          child: IconButton(
              onPressed: () {
                setState(() {
                  dashboardProvider.fetchTransactions(context);
                });
              },
              icon: Icon(
                Icons.refresh_outlined,
                size: 40,
                color: AppColors.colors.blue,
              )),
        ),
        Padding(
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
                  // tiles representing registered student count
                  DashBoardTile(
                    number: dashboardProvider.transactions.isEmpty
                        ? '--'
                        : '${dashboardProvider.m['studentCount']}',
                    title: 'Student Registered',
                    onTap: () {
                      homepageProvider.setIndex(1);
                    },
                  ),
                  // tiles representing registered book count
                  DashBoardTile(
                    number: dashboardProvider.transactions.isEmpty
                        ? '--'
                        : '${dashboardProvider.m['bookCount']}',
                    title: 'Book Registered',
                    onTap: () {
                      homepageProvider.setIndex(2);
                    },
                  ),
                  // tiles representing suscessful transaction count
                  DashBoardTile(
                    number: dashboardProvider.transactions.isEmpty
                        ? '--'
                        : '${dashboardProvider.m['transactionCount']}',
                    title: 'Total Transactions',
                    onTap: () {
                      homepageProvider.setIndex(3);
                    },
                  ),
                ],
              ),
              // Container shows recent five transactions
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.43,
                margin: const EdgeInsets.only(top: 60),
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
                    const SizedBox(
                      height: 30,
                    ),
                    dashboardProvider.transactions.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: ListView.builder(
                                itemCount: 5,
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
                                }))),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
