import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// This file contains the skeleton tile dashboard widget
// SkeletonTileDashBoard is used to display the loading animation on the
// dashboard screen and various screen.

class SkeletonTileDashBoard extends StatelessWidget {
  const SkeletonTileDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.colors.tileBackground,
        highlightColor: Colors.grey[700]!,
        child: Container(
          width: 260,
          height: 130,
          decoration: BoxDecoration(
            color: AppColors.colors.tileBackground.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: 150,
                    height: 25,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colors.buttonBackground,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 100,
                      height: 25,
                      margin: const EdgeInsets.only(left: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colors.buttonBackground,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 30,
                      margin: const EdgeInsets.only(left: 15, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colors.buttonBackground,
                      ),
                    ),
                  ],
                )
              ]),
        ));
  }
}
