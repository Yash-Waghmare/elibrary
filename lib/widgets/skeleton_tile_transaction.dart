import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// This file contains the skeleton tile widget
// SkeletonTile is used to display the loading animation on the screen
// when the data is being fetched from the database.

class SkeletonTileTransaction extends StatelessWidget {
  const SkeletonTileTransaction({super.key});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.colors.tileBackground,
      highlightColor: Colors.grey[700]!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        width: 1000,
        height: 60,
        decoration: BoxDecoration(
            color: AppColors.colors.tileBackground.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                margin: const EdgeInsets.only(left: 70, top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
              const SizedBox(
                width: 90,
              ),
              Container(
                width: 260,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
              const SizedBox(
                width: 70,
              ),
              Container(
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Container(
                width: 180,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
