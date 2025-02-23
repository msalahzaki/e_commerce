import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/domain/entities/GetWishListResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemWidget extends StatelessWidget {
  const WishlistItemWidget(this.product,{super.key});
  final WishListDataEntity? product;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Container
          Container(
            height: 120.h,
            width: 120.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(20), // Apply border radius here
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                product?.imageCover ??"",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColor.darkGrey,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 150.w,
                      child: AutoSizeText(maxLines: 1,minFontSize: 10,
                          product?.title ?? "",
                          style: AppStyles.bold16primary),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Image.asset(AppAssets.iconHeart),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                AutoSizeText(maxLines: 2,
                  product?.description ?? "Description",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.normal14primary
                ),
                SizedBox(height: 8.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("EG ${product?.price ?? 0 }",
                        style: AppStyles.bold16primary
                            .copyWith(color: AppColor.primary)),
                    Text(
                      "${(product?.price ?? 0 )+300 }",
                      style: AppStyles.normal14primary.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 5),
                          backgroundColor: AppColor.primary),
                      child: Text(
                        "Add To Cart",
                        style: AppStyles.normal14white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),

        ],
      ),
    );
  }
}
