import 'package:elibrary/pages/dashboard.dart';
import 'package:elibrary/pages/student.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> screens =[DashBoard(),Student(),SizedBox(),SizedBox()];
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
                  isSelected: index==0?true:false,
                  menuName: 'Dashboard',
                  function: () {
                    setState(() {
                      index = 0;
                    });
                  },
                ),
                HomePageTile(
                  iconPath: 'icons/read.png',
                  isSelected: index==1?true:false,
                  menuName: 'Students',
                  function: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
                HomePageTile(
                  iconPath: 'icons/booksStack.png',
                  isSelected: index==2?true:false,
                  menuName: 'Books',
                  function: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
                HomePageTile(
                  iconPath: 'icons/transaction.png',
                  isSelected: index==3?true:false,
                  menuName: 'Transaction',
                  function: () {
                    setState(() {
                      index = 3;
                    });
                  },
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
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: screens[index])
      ],
    ));
  }
}

class HomePageTile extends StatelessWidget {
  final bool isSelected;
  final String menuName;
  final String iconPath;
  void Function() function;
  HomePageTile(
      {super.key,
      required this.isSelected,
      required this.menuName,
      required this.iconPath,
      required this.function});
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
          onTap: function,
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
