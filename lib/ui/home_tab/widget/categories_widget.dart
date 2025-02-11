import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  AppAssets.categoryHomeImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "men's fashion",
              style: AppStyles.normal14primary),

          ],
        );
      },
    );
  }
}
