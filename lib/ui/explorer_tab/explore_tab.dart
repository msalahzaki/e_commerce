import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/ui/explorer_tab/cubit/explorer_tab_states.dart';
import 'package:e_commerce/ui/explorer_tab/cubit/explorer_tab_viewModel.dart';
import 'package:e_commerce/ui/explorer_tab/widget/product_item_widget.dart';
import 'package:e_commerce/ui/home_tab/widget/cart_item_count_cubit.dart';
import 'package:e_commerce/ui/home_tab/widget/search_cart_widget.dart';
import 'package:e_commerce/ui/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key});

  final ExplorerTabViewmodel viewmodel = getIt<ExplorerTabViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SearchCartWidget(),
            SizedBox(height: 15.h),
            Expanded(
              child: BlocConsumer<ExplorerTabViewmodel, ExplorerTabStates>(
                bloc: viewmodel..getAllProducts(),
                listener: (context, state) {
                  if(state is AddedToCartSuccessState) {
                    BlocProvider.of<CartItemCountCubit>(context).updateCartCount(state.cardItemCount);
                    Fluttertoast.showToast(
                      msg: "Product Added To Card",
                  );
                    return ;
                  }

                },
                builder: (context, state) {
                  if (state is ProductsLoadingState) {
                    return  Center(
                      child: CircularProgressIndicator(color: AppColor.primary),
                    );
                  } else if (state is ProductsErrorState) {
                    return Center(
                      child: Text(state.errorMassage, style: AppStyles.bold20primary),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.8,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                      ),
                      itemCount: viewmodel.allProduct.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  ProductDetails(viewmodel.allProduct[index],viewmodel),
                            ));
                          },
                          child: ProductItemWidget(viewmodel.allProduct[index], viewmodel),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
