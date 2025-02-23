import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/ui/favorite_tab/cubit/wishList_states.dart';
import 'package:e_commerce/ui/favorite_tab/cubit/wishlist_viewmodel.dart';
import 'package:e_commerce/ui/favorite_tab/wishList_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_styles.dart';
import '../home_tab/widget/search_cart_widget.dart';

class FavoriteTab extends StatelessWidget {
  FavoriteTab({super.key});
  final WishlistViewmodel viewmodel = getIt<WishlistViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SearchCartWidget(),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
              child: BlocConsumer<WishlistViewmodel, WishlistStates>(
    bloc: viewmodel..getWishList(),
    listener: (context, state) {
       },
    builder: (context, state) {
    if (state is GetWishlistLoadingState) {
    return  Center(
    child: CircularProgressIndicator(color: AppColor.primary),
    );
    } else if (state is GetWishlistErrorState) {
    return Center(
    child: Text(state.errorMessage, style: AppStyles.bold20primary),
    );
    }
    else {
      return  ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
                  itemCount: viewmodel.wishListProducts.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return WishlistItemWidget(viewmodel.wishListProducts[index]);
                  },
                );

    }}
    )
              )
            ],
          )
            ),
    );
  }
}
