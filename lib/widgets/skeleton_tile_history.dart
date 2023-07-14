import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// This file contains the skeleton tile history widget
// SkeletonTileHistory is used to display the loading animation on the screen
// when the data is being fetched from the database.

class SkeletonTileHistory extends StatelessWidget {
  const SkeletonTileHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.colors.tileBackground,
        highlightColor: Colors.grey[700]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 75, right: 100),
                width: 30,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                alignment: Alignment.center,
                width: 210,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Container(
                width: 100,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 80),
                width: 100,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
            ],
          ),
        ));
  }
}
