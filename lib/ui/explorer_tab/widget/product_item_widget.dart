import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/domain/entities/GetAllProductsEntity.dart';
import 'package:e_commerce/ui/explorer_tab/cubit/explorer_tab_viewModel.dart';
import 'package:e_commerce/ui/favorite_tab/cubit/wishList_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../favorite_tab/cubit/wishlist_viewmodel.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(this.product, this.viewmodel, {super.key});
  final AllProductEntity product;
  final ExplorerTabViewmodel viewmodel;
  @override
  Widget build(BuildContext context) {
    bool isFavor = WishlistViewmodel.get(context).isInWishList(product.id ?? "");
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(width: 2, color: AppColor.darkGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: 190.h,
                  width: 200.w,
                  imageUrl: product.imageCover!,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColor.darkGrey,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: BlocBuilder<WishlistViewmodel,WishlistStates>(
                    bloc: WishlistViewmodel.get(context),
                    builder: (context, state) {
                      bool isFavor = WishlistViewmodel.get(context).isInWishList(product.id ?? "");
                      return IconButton(
                          onPressed: () {
                            isFavor
                                ? WishlistViewmodel.get(context)
                                .removeFromWishList(product.id ?? "")
                                :  WishlistViewmodel.get(context).
                            addToWishList(product.id ?? "");
                          },
                          icon: Image.asset(
                            isFavor
                                ? AppAssets.iconClickedHeart
                                : AppAssets.iconHeart,
                            width: 20.w,
                          )) ; 
                    },
                   
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          AutoSizeText(
            product.title!,
            style: AppStyles.normal16primary,
            maxLines: 1,
          ),
          Row(
            children: [
              Text(
                "EG ${product.price} ",
                style: AppStyles.normal16primary,
              ),
              Text(
                "${product.price! + 300}",
                style: AppStyles.normal14primary.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Review ${product.ratingsAverage} ",
                style: AppStyles.normal16primary,
              ),
              Image.asset("assets/icons/ic_rate.png"),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    viewmodel.addProductToCart(product.id!);
                  },
                  icon: Image.asset(
                    "assets/icons/iconAdd.png",
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
