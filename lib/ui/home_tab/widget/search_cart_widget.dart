import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/ui/cart/cart_details.dart';

import 'package:e_commerce/ui/home_tab/widget/cart_item_count_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchCartWidget extends StatelessWidget {
  const SearchCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppAssets.route),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Image.asset(AppAssets.searchIcon),
                  hintText: "What do you search for?",
                ),
              ),
            ),
            SizedBox(width: 15.w),


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
      ],
    );
  }
}
