import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/ui/cart/cart_item_widget.dart';
import 'package:e_commerce/ui/cart/cubit/cart_viewModel.dart';
import 'package:e_commerce/ui/cart/cubit/get_card_states.dart';
import 'package:e_commerce/ui/home_tab/widget/cart_item_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartDetails extends StatelessWidget {
   CartDetails({super.key});
final CartViewModel viewModel = getIt<CartViewModel>();
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
    BlocBuilder<CartItemCountCubit, int>( builder: (context, cartCount) {
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
    ),]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => viewModel..getCart(),
          child: BlocConsumer<CartViewModel,GetCardStates>(
            listener: (context, state) {

          },
            builder:(context, state) {
              if (state is GetCardLoadingState) {
                return Center(
                  child: CircularProgressIndicator(color: AppColor.primary),
                );
              } else if (state is GetCardErrorState) {
                return Center(
                  child: Text(state.errorMessage, style: AppStyles.bold20primary),
                );
              } else {
                BlocProvider.of<CartItemCountCubit>(context).updateCartCount(viewModel.itemInCard);
                return Column(
                  children: [
                    Expanded(
                        child: ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                           itemCount:viewModel.cartDetails?.data?.products?.length  ?? 0,
                            itemBuilder: (context, index) {
                           return CartItemWidget(viewModel.cartDetails?.data?.products![index]);
                            },
                        )
                    ),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Total Price", style: AppStyles.normal18white
                                .copyWith(
                                color: AppColor.primary.withOpacity(.5)),),
                            Text("EGP ${viewModel.cartDetails?.data?.totalCartPrice ?? 0}", style: AppStyles.normal14primary,),


                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary
                            ),
                            child:
                            Row(
                              children: [
                                Text(
                                  "Check Out", style: AppStyles.normal20white,),
                                SizedBox(width: 20.w,),
                                Icon(Icons.arrow_right_alt_rounded,
                                  color: AppColor.white, size: 30.h,)

                              ],
                            ))
                      ],
                    )
                  ],
                );
              }
            }

          ),
        ),
      ),
    );
  }
}
