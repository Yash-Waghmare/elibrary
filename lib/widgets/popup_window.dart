import 'package:flutter/material.dart';
import '../constant/colors.dart';

// Widget Caller
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return PopUpFrame(
// title: 'Cancelling this ride',
// button1Text: 'Cancel',
// button2Text: 'Add',
// function: () {},
// container: Container(
// child: Column(
// children: [
// Text(
// 'dgsfhs',
// style: appTheme().textTheme.headlineSmall,
// ),
//
// Text(
// 'dgsfhs',
// style: appTheme().textTheme.headlineSmall,
// ),
// Text(
// 'dgsfhs',
// style: appTheme().textTheme.headlineSmall,
// )
// ],
// ),
// ),
// );
// });


// TODO @sarvesh will complete this
class PopUpFrame extends StatelessWidget {
  PopUpFrame({
    required this.title,
    required this.button1Text,
    required this.button2Text,
    this.buttonNeed = false,
    required this.function,
    required this.container
  });

  String title, button1Text, button2Text;
  bool buttonNeed;
  Container container;
  void Function() function;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.centerLeft,
      titlePadding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.colors.black),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: container,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
