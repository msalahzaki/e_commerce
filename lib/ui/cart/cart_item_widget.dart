import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/GetCardResponseEntity.dart';
import 'package:e_commerce/ui/cart/cubit/cart_viewModel.dart';
import 'package:e_commerce/ui/cart/cubit/get_card_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(this.product, {super.key});
  final CartProductsEntity? product;
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
                product?.product?.imageCover ??"",
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
                Text( product?.product?.title ??"", style: AppStyles.bold16primary),
                SizedBox(height: 8.h),
                Text( product?.product?.description ??"",overflow: TextOverflow.ellipsis,
                    style: AppStyles.normal14primary),
                SizedBox(height: 8.h),
                Text("EG ${ product?.price ??""} ",
                    style: AppStyles.bold16primary.copyWith(
                        color: AppColor.primary)),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){
                BlocProvider.of<CartViewModel>(context).updateProductCount(productID: product?.product?.id ??"", newCount: "0");

              }, icon: Icon(Icons.delete_outline,color: AppColor.primary,)),
              SizedBox(height: 8.h),
              Container(padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(color: AppColor.primary,
                      borderRadius: const BorderRadius.all(Radius.circular(50))
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){

                        int newcount = product!.count!.toInt() -1  ;
                        BlocProvider.of<CartViewModel>(context).updateProductCount(productID: product?.product?.id ??"", newCount: "$newcount");


                      }, icon: Image.asset("assets/icons/icon_decrement.png")),
                      BlocProvider.of<CartViewModel>(context).state is UpdateProductCountState  && BlocProvider.of<CartViewModel>(context).productid == product!.product!.id
                          ?
                        SizedBox(height: 15.h,width: 10.w,
                            child: CircularProgressIndicator(color: AppColor.white,)):
                      Text("${product?.count ?? 0}",style: AppStyles.bold20white,),


                      IconButton(onPressed: (){
                        int newcount = product!.count!.toInt() +1  ;
                        BlocProvider.of<CartViewModel>(context).updateProductCount(productID: product?.product?.id ??"", newCount: "$newcount");
                      }, icon: Image.asset("assets/icons/icon_increment.png"))
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
