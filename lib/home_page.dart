import 'package:elibrary/providers/homepage_provider.dart';
import 'package:elibrary/screens/dashboard.dart';
import 'package:elibrary/screens/fine_screen.dart';
import 'package:elibrary/screens/login_screen.dart';
import 'package:elibrary/screens/student_screen.dart';
import 'package:elibrary/screens/book_screen.dart';
import 'package:elibrary/screens/transaction_screen.dart';
import 'package:elibrary/widgets/menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    const DashBoard(),
    const StudentScreen(),
    const BookScreen(),
    const TransactionScreen(),
    const Fine()
  ];

  @override
  Widget build(BuildContext context) {
    HomePageProvider homepageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
        body: Row(
      children: [
        Container(
          width: 350,
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
                const SizedBox(
                  height: 40,
                ),
                MenuTile(
                  iconPath: 'icons/home.png',
                  isSelected: homepageProvider.index == 0 ? true : false,
                  menuName: 'Dashboard',
                  function: () {
                    homepageProvider.setIndex(0);
                  },
                ),
                MenuTile(
                  iconPath: 'icons/read.png',
                  isSelected: homepageProvider.index == 1 ? true : false,
                  menuName: 'Students',
                  function: () {
                    setState(() {
                      homepageProvider.setIndex(1);
                    });
                  },
                ),
                MenuTile(
                  iconPath: 'icons/booksStack.png',
                  isSelected: homepageProvider.index == 2 ? true : false,
                  menuName: 'Books',
                  function: () {
                    setState(() {
                      homepageProvider.setIndex(2);
                    });
                  },
                ),
                MenuTile(
                  iconPath: 'icons/transaction.png',
                  isSelected: homepageProvider.index == 3 ? true : false,
                  menuName: 'Transaction',
                  function: () {
                    setState(() {
                      homepageProvider.setIndex(3);
                    });
                  },
                ),
                MenuTile(
                  iconPath: 'icons/calculator.png',
                  isSelected: homepageProvider.index == 4 ? true : false,
                  menuName: 'Calculate Fine',
                  function: () {
                    setState(() {
                      homepageProvider.setIndex(4);
                    });
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                const CircleAvatar(
                  radius: 53,
                  child: Image(
                    image: AssetImage('icons/pccoeLogo.png'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'PCCOE Library',
                    style: GoogleFonts.inter(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 156, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF7F7C7C))),
                  child: IconButton(
                    icon: const Image(image: AssetImage('icons/logout.png')),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      homepageProvider.remove();
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginScreen()));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Scaffold(
          body: screens[homepageProvider.index],
        ))
      ],
    ));
  }
}
