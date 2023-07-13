import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/providers/dashboard_provider.dart';
import 'package:elibrary/widgets/skeleton_tile_dashboard.dart';
import 'package:elibrary/widgets/skeleton_tile_history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../constant/theme.dart';
import '../providers/homepage_provider.dart';
import '../widgets/dashboard_tile.dart';
import '../widgets/history_tile.dart';

// DashBoard is used the overall view of the library
// It contains the functionality of:
// 1. Displaying the total number of books in the library
// 2. Displaying the total number of students registered in the library
// 3. Displaying the total number of transactions in the library
// 4. Displaying the recent five transactions in the library

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
      padding: EdgeInsets.only(top: 30),
      color: AppColors.colors.background,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
          // refresh button is used to refresh the dashboard page
          child: IconButton(
              onPressed: () {
                setState(() {
                  dashboardProvider.isLoading = true;
                  dashboardProvider.transactions = [];
                  dashboardProvider.m = {};
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // tiles representing registered student count
                  dashboardProvider.isLoading == true
                      ? const SkeletonTileDashBoard()
                      : DashBoardTile(
                          number: '${dashboardProvider.m['studentCount']}',
                          title: 'Student Registered',
                          onTap: () {
                            homepageProvider.setIndex(1);
                          },
                        ),
                  // tiles representing registered book count
                  dashboardProvider.isLoading == true
                      ? const SkeletonTileDashBoard()
                      : DashBoardTile(
                          number: '${dashboardProvider.m['bookCount']}',
                          title: 'Book Registered',
                          onTap: () {
                            homepageProvider.setIndex(2);
                          },
                        ),
                  // tiles representing suscessful transaction count
                  dashboardProvider.isLoading == true
                      ? const SkeletonTileDashBoard()
                      : DashBoardTile(
                          number: '${dashboardProvider.m['transactionCount']}',
                          title: 'Total Transactions',
                          onTap: () {
                            homepageProvider.setIndex(3);
                          },
                        ),
                ],
              ),
              // Container shows recent five transactions
              Container(
                width: 1000,
                height: 410,
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
                          'Transaction ID',
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Student Name',
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
                    dashboardProvider.isLoading == false
                        ? dashboardProvider.transactions.isNotEmpty
                            ? Expanded(
                                child: Center(
                                child: ListView.builder(
                                    itemCount:
                                        dashboardProvider.transactions.length,
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
                                    })),
                              ))
                            : Center(
                                child: Text('No Recent Transactions',
                                    style: appTheme()
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          color: AppColors.colors.white,
                                        )))
                        : Expanded(
                            child: ListView.builder(
                                itemCount: 7,
                                itemBuilder: ((context, i) {
                                  return const SkeletonTileHistory();
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
