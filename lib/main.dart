import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/providers/dashboard_provider.dart';
import 'package:elibrary/providers/homepage_provider.dart';
import 'package:elibrary/providers/student_provider.dart';
import 'package:elibrary/providers/book_provider.dart';
import 'package:elibrary/providers/transaction_provider.dart';
import 'package:elibrary/screens/login_screen.dart';
import 'package:elibrary/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'home_page.dart';

// This is the main file which is being run when the app is started
// This file contains the main function which is being run when the app is started
// The file initializes the firebase and the provider package
// First the splash screen is being displayed while the app functionalites are being initialized
// After the initialization the app checks if the user is logged in or not
// If the user is logged in then the home page is being displayed
// If the user is not logged in then the login screen is being displayed.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomePageProvider(index: 0),
      ),
      ChangeNotifierProvider(
        create: (context) => StudentProvider(context: context),
      ),
      ChangeNotifierProvider(
        create: (context) => BookProvider(context: context),
      ),
      ChangeNotifierProvider(
        create: (context) => TransactionProvider(context: context),
      ),
      ChangeNotifierProvider(
        create: (context) => DashboardProvider(context: context),
      )
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  bool validToken = false, loading = true;

  Future<void> checkAdmin() async {
    validToken = await AuthService().checkAdmin(context: context);
    Future.delayed(
        const Duration(seconds: 3),
        () => {
              setState(() {
                loading = false;
              })
            });
  }

  @override
  void initState() {
    super.initState();
    checkAdmin();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            backgroundColor: const Color(0XFF1f6cc7),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Welcome To Pccoe Library',
                      style: appTheme().textTheme.headlineLarge,
                    ),
                  ),
                  const Image(
                    image: AssetImage('icons/library.gif'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Loading ......',
                        style: appTheme().textTheme.headlineLarge),
                  )
                ],
              ),
            ),
          )
        : validToken
            ? const HomePage()
            : const LoginScreen();
  }
}
