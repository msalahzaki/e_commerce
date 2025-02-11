import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/AllCategoriesEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
   const CategoriesWidget({super.key, required this.category, });
final List<CategoryEntity> category;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: category.length,
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
                child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: category[index].image ??"",
        placeholder: (context, url) =>  Center(
        child: CircularProgressIndicator(
        color: AppColor.grey,
        ),
        ),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
        ),
                ),
              ),

            SizedBox(height: 5.h),
            Text(
                category[index].name ??"",
              style: AppStyles.normal14primary),

          ],
        );
      },
    );
  }
}
