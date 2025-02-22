import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';
import 'package:e_commerce/ui/cart/cart_details.dart';
import 'package:e_commerce/ui/explorer_tab/cubit/explorer_tab_viewModel.dart';
import 'package:e_commerce/ui/home_tab/widget/cart_item_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetails extends StatelessWidget {
   const ProductDetails(this.product,this.viewmodel, {super.key});
  final AllProductEntity product ;
  final ExplorerTabViewmodel viewmodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text("Product Details",style: AppStyles.normal16primary,),
      actions: [
        IconButton(onPressed: (){}, icon: Image.asset(AppAssets.searchIcon)),
        BlocBuilder<CartItemCountCubit, int>(
          builder: (context, cartCount) {
            return IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CartDetails()),
                );
              },
              icon: Badge(
                label: Text(cartCount.toString()), // Dynamic count
                child: Image.asset(AppAssets.shoppingCart),
              ),
            );
          },
        ),
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
                    height: 300.h,
                    aspectRatio: 16 / 9),
                itemCount: product.images?.length ?? 0,
                itemBuilder: (context, index, realIndex) {
                  return Container(clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20),),
                  border: Border.all(width: 2,color: AppColor.grey),),
                    child: Image.network(
                      product.images?[index] ?? "",
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
                Text(product.title??"",style: AppStyles.bold16primary),
                Text("EGP ${product.price}",style: AppStyles.bold16primary),

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
                  child: Text("${product.sold}  Sold",style: AppStyles.normal14primary,),
                ),
                SizedBox(width: 10.w,),
                Image.asset("assets/icons/ic_rate.png"),
                SizedBox(width: 10.w,),
                Text("${product.ratingsAverage}  (${product.ratingsQuantity} )",style: AppStyles.normal14primary,),
                Spacer(),
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
            Text("${product.description} ",style: AppStyles.normal16primary,),
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
                    onPressed: ()async{
                     if( await viewmodel.addProductToCart(product.id!)){
                       Fluttertoast.showToast(msg: "Product Added To Cart");
                     }
                    },
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
