import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/ui/explorer_tab/cubit/explorer_tab_states.dart';
import 'package:e_commerce/ui/explorer_tab/cubit/explorer_tab_viewModel.dart';
import 'package:e_commerce/ui/explorer_tab/widget/product_item_widget.dart';
import 'package:e_commerce/ui/home_tab/widget/search_cart_widget.dart';
import 'package:e_commerce/ui/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key});

  final ExplorerTabViewmodel viewmodel = getIt<ExplorerTabViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchCartWidget(),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 6000.h,
                child: BlocBuilder<ExplorerTabViewmodel, ExplorerTabStates>(
                    bloc: viewmodel..getAllProducts(),
                    builder: (context, state) {
                      if (state is ProductsLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ProductsErrorState) {
                        return Center(
                          child: Text(state.errorMassage),
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 2.8,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: viewmodel.allProduct.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const ProductDetails(),
                                  ));
                                },
                                child:  ProductItemWidget(viewmodel.allProduct[index]));
                          },
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
