import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';

class SkeletonTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 1000,
      height: 75,
      decoration: BoxDecoration(
          color: AppColors.colors.tileBackground.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 125,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colors.buttonBackground.withOpacity(0.9),
              ),
            ),
            Container(
              width: 225,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colors.buttonBackground.withOpacity(0.9),
              ),
            ),
            Container(
              width: 220,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colors.buttonBackground.withOpacity(0.9),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colors.buttonBackground.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
