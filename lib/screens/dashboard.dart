import 'package:elibrary/constant/colors.dart';
import 'package:elibrary/providers/dashboard_provider.dart';
import 'package:elibrary/widgets/skeleton_tile_dashboard.dart';
import 'package:elibrary/widgets/skeleton_tile_history.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // tiles representing registered student count
                  dashboardProvider.transactions.isEmpty
                      ? SkeletonTileDashBoard()
                      : DashBoardTile(
                          number: '${dashboardProvider.m['studentCount']}',
                          title: 'Student Registered',
                          onTap: () {
                            homepageProvider.setIndex(1);
                          },
                        ),
                  // tiles representing registered book count
                  dashboardProvider.transactions.isEmpty
                      ? SkeletonTileDashBoard()
                      : DashBoardTile(
                          number: '${dashboardProvider.m['bookCount']}',
                          title: 'Book Registered',
                          onTap: () {
                            homepageProvider.setIndex(2);
                          },
                        ),
                  // tiles representing suscessful transaction count
                  dashboardProvider.transactions.isEmpty
                      ? SkeletonTileDashBoard()
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
                height: 325,
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
                    dashboardProvider.transactions.isEmpty
                        ? Expanded(
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: ((context, i) {
                                  return SkeletonTileHistory();
                                })))
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
