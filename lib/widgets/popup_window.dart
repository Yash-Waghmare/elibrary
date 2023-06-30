import 'package:elibrary/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/theme.dart';

// Widget Caller
// Navigator.of(context)
//     .push(HeroDialogRoute(builder: (context) {
// return PopUpFrame(
// height: MediaQuery.of(context).size.width * 0.34,
// width: MediaQuery.of(context).size.width * 0.25,
// title: 'Add Student',
// buttonText: 'Add',
// function: () {
// },
// children: [
// // TODO put the required textfields
// ],
// );
// }));

class PopUpFrame extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  PopUpFrame(
      {required this.height,
      required this.width,
      required this.title,
      required this.buttonText,
      required this.function,
      required this.children,
      this.isButtonNeeded = true});
  double height, width;
  String title, buttonText;
  bool isButtonNeeded;
  void Function() function;
  String heroAddTodo = 'pop-up-card';
  List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: heroAddTodo,
        child: Material(
          color: AppColors.colors.popUpBackground,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Container(
              width: width,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: appTheme()
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                    child: Column(children: children),
                  ),
                   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isButtonNeeded
                                ?CustomButton(
                              buttonText: 'Cancel',
                              buttonColor: AppColors.colors.buttonBackground,
                              function: () {
                                Navigator.pop(context);
                              },
                              height: 50,
                              width: 150,
                              textColor: AppColors.colors.white,
                              fsize: 18,
                              fWeight: FontWeight.w400,
                            ):SizedBox(),
                            CustomButton(
                              buttonText: buttonText,
                              buttonColor: AppColors.colors.buttonBackground,
                              function: function,
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
        ),
      ),
    );
  }
}
