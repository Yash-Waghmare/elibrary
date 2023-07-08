import 'package:elibrary/widgets/popup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:elibrary/constant/theme.dart';
import 'package:elibrary/constant/colors.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
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
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('icons/libraryLogo.png'),
                  width: 400,
                  height: 300,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Viveka e-Library \nSolutions',
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
            Material(
              color: AppColors.colors.popUpBackground,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: 500,
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
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 20),
                      child: Column(children: [
                        PopUpTextfield(
                            controller: userNameController,
                            hintText: 'Username'),
                        PopUpTextfield(
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
                          function: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
