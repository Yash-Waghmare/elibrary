import 'package:elibrary/constant/handler.dart';
import 'package:elibrary/home_page.dart';
import 'package:elibrary/services/auth_service.dart';
import 'package:elibrary/widgets/popup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/constant/colors.dart';

import '../widgets/custom_button.dart';

// LoginScreen is used to login into the app
// Login Screen contains the functionality of:
// 1. Logging in as an admin
// As the system is for the admin only, the login screen is only for the admin.
// The admin can login using the email and password provided to him/her by the developer.

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(1, 1),
            colors: [Color(0xff380036), Color(0xff0CBABA)],
            tileMode: TileMode.mirror,
            stops: [0.2, 1.0],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('icons/libraryLogo.png'),
                  width: 400,
                  height: 300,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'E-Library Solutions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 70,
            ),
            Container(
              width: 450,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.colors.popUpBackground,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: appTheme()
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Column(children: [
                      PopUpTextfield(
                          controller: emailController, hintText: 'Email'),
                      PopUpTextfield(
                          isPassword: true,
                          controller: passwordController,
                          hintText: 'password')
                    ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        buttonText: 'Login',
                        buttonColor: AppColors.colors.buttonBackground,
                        function: () async {
                          bool result = await AuthService().loginAdmin(
                              context: context,
                              email: emailController.text,
                              adminPassword: passwordController.text);
                          if (result) {
                            emailController.clear();
                            passwordController.clear();
                            if (context.mounted) {
                              showSnackBar(
                                  context, 'Admin Logged In Succesfull', false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomePage()));
                            }
                          }
                        },
                        height: 50,
                        width: 150,
                        textColor: AppColors.colors.white,
                        fsize: 18,
                        fWeight: FontWeight.w400,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
