import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';

class SkeletonBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      alignment: Alignment.center,
      width: 380,
      height: 170,
      decoration: BoxDecoration(
          color: AppColors.colors.tileBackground.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.colors.buttonBackground.withOpacity(0.9),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      height: 30,
                      margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            AppColors.colors.buttonBackground.withOpacity(0.9),
                      ),
                    ),
                    Container(
                      width: 160,
                      height: 20,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            AppColors.colors.buttonBackground.withOpacity(0.9),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            AppColors.colors.buttonBackground.withOpacity(0.9),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 20,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            AppColors.colors.buttonBackground.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              alignment: Alignment.topRight,
              width: 60,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.colors.buttonBackground.withOpacity(0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
