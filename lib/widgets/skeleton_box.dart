import 'package:elibrary/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// This file contains the skeleton box widget
// SkeletonBos is used to display the loading animation on the various screen
// when the data is been fetched from the database

class SkeletonBox extends StatelessWidget {
  const SkeletonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.colors.tileBackground,
      highlightColor: Colors.grey[700]!,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        alignment: Alignment.center,
        width: 380,
        height: 140,
        decoration: BoxDecoration(
            color: AppColors.colors.tileBackground.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 140,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colors.buttonBackground,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 110,
                        height: 15,
                        margin:
                            const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.colors.buttonBackground,
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 85,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.colors.buttonBackground,
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 15,
                        margin: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.colors.buttonBackground,
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.colors.buttonBackground,
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
                width: 50,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.colors.buttonBackground,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
