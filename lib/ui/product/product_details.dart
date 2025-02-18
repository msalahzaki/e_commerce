import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Product Details",style: AppStyles.normal16primary,),
      actions: [
        IconButton(onPressed: (){}, icon: Image.asset(AppAssets.searchIcon)),
        IconButton(onPressed: (){}, icon: Image.asset(AppAssets.iconCart)),
      ],
      ),
      body: Padding(padding: const EdgeInsets.all(8),
      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children:[ CarouselSlider.builder(
                     options: CarouselOptions(
                     viewportFraction: 1,
                    autoPlay: true,
                    height: 200.h,
                    aspectRatio: 16 / 9),
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return Container(decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20),),
                  border: Border.all(width: 2,color: AppColor.grey),),
                    child: Image.asset(
                      "assets/images/CarouselSlider${index + 1}.png",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
                Positioned(
                  top: 5, right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Image.asset(AppAssets.iconHeart),
                  ),
                )
            ]),
            SizedBox(height: 10.h,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Nike Jordon ",style: AppStyles.bold16primary),
                Text("EG 3,500 ",style: AppStyles.bold16primary),

              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Container(padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(
                    color: AppColor.grey,width: 2
                  ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))
                  ),
                  child: Text("3230  Sold",style: AppStyles.normal14primary,),
                ),
                SizedBox(width: 10.w,),
                Image.asset("assets/icons/ic_rate.png"),
                SizedBox(width: 10.w,),
                Text("4.8  (7,500)",style: AppStyles.normal14primary,),
                SizedBox(width: 60.w,),
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
            SizedBox(height: 10.h,),
            Text("Description ",style: AppStyles.bold20primary,),
            SizedBox(height: 10.h,),
            Text("Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories ",style: AppStyles.normal16primary,),
        SizedBox(height: 300.h,),
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
                    Image.asset(AppAssets.iconCart,color: AppColor.white,),
                    SizedBox(width: 10.w,),
                    Text("Add To Cart",style: AppStyles.normal20white,),

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
