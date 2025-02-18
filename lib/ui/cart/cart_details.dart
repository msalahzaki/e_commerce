import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/ui/cart/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
          style: AppStyles.normal16primary,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppAssets.searchIcon)),
          IconButton(onPressed: () {}, icon: Image.asset(AppAssets.iconCart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CartItemWidget(),
            Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total Price",style: AppStyles.normal18white.copyWith(color: AppColor.primary.withOpacity(.5)),),
                    Text("EGP 3,500",style: AppStyles.normal14primary,),


                  ],
                ),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary
                    ),
                    child:
                    Row(
                      children: [
                        Text("Check Out",style: AppStyles.normal20white,),
                        SizedBox(width: 20.w,),
                       Icon(Icons.arrow_right_alt_rounded,color: AppColor.white,size: 30.h,)
                        
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
