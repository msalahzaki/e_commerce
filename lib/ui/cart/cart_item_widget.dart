import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

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
              borderRadius: BorderRadius.circular(20), // Apply border radius here
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                "https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg",
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
                Text("Product Name", style: AppStyles.bold16primary),
                SizedBox(height: 8.h),
                Text("Description goes here...",
                    style: AppStyles.normal14primary),
                SizedBox(height: 8.h),
                Text("EG 3.5000 ",
                    style: AppStyles.bold16primary.copyWith(
                        color: AppColor.primary)),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline,color: AppColor.primary,)),
              SizedBox(height: 8.h),
              Container(padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(color: AppColor.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Image.asset("assets/icons/icon_decrement.png")),
                      Text("1",style: AppStyles.bold20white,),
                      IconButton(onPressed: (){}, icon: Image.asset("assets/icons/icon_increment.png"))
                    ],
                  )
              ),

            ],
          ),
        ],
      ),
    );
  }
}
