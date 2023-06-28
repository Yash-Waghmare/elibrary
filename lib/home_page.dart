import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/pages/dashboard.dart';
import 'package:elibrary/widgets/hero_dialogue_route.dart';
import 'package:elibrary/widgets/popup_window.dart';
// import 'package:elibrary/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: 410,
          color: AppColors.colors.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 39),
            child: ListView(
              children: [
                const Image(
                  image: AssetImage('icons/libraryLogo.png'),
                  width: 208,
                  height: 113,
                ),
                SizedBox(
                  height: 40,
                ),
                HomePageTile(
                  iconPath: 'icons/home.png',
                  isSelected: true,
                  menuName: 'Dashboard',
                ),
                HomePageTile(
                  iconPath: 'icons/read.png',
                  isSelected: false,
                  menuName: 'Students',
                ),
                HomePageTile(
                  iconPath: 'icons/booksStack.png',
                  isSelected: false,
                  menuName: 'Books',
                ),
                HomePageTile(
                  iconPath: 'icons/transaction.png',
                  isSelected: false,
                  menuName: 'Transaction',
                ),
                SizedBox(
                  height: 70,
                ),
                CircleAvatar(
                  radius: 53,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Organization Name',
                    style: GoogleFonts.inter(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 186, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFF7F7C7C))),
                  child: IconButton(
                    icon: Image(image: AssetImage('icons/logout.png')),
                    onPressed: () {

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: DashBoard())
      ],
    ));
  }
}

class HomePageTile extends StatelessWidget {
  final bool isSelected;
  final String menuName;
  final String iconPath;
  const HomePageTile(
      {super.key,
      required this.isSelected,
      required this.menuName,
      required this.iconPath});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 106, top: 0, right: 106),
      width: 200,
      height: 46,
      decoration: BoxDecoration(
          color: isSelected
              ? AppColors.colors.buttonBackground
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: ListTile(
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          onTap: () {},
          leading: Image(
            image: AssetImage(iconPath),
            width: 17,
            height: 17,
          ),
          title: Center(
            child: Text(
              menuName,
              style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
