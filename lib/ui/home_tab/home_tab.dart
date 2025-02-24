import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:e_commerce/core/di/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:e_commerce/ui/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce/ui/home_tab/cubit/home_tab_viewModel.dart';
import 'package:e_commerce/ui/home_tab/widget/categories_widget.dart';
import 'package:e_commerce/ui/home_tab/widget/home_product_widget.dart';
import 'package:e_commerce/ui/home_tab/widget/search_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});
  final HomeTabViewmodel viewmodel = getIt<HomeTabViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchCartWidget(),
                SizedBox(
                  height: 20.h,
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      height: 200.h,
                      aspectRatio: 16 / 9),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Image.asset(
                      "assets/images/CarouselSlider${index + 1}.png",
                      fit: BoxFit.cover,
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("      Categories"),
                    Text("view all         "),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<HomeTabViewmodel, HomeTabStates>(
                  bloc: viewmodel..getAllCategories(),
                  builder: (context, state) {
                    if (state is CategoriesLoadingState) {
                      return const CircularProgressIndicator();
                    } else if (state is CategoriesErrorState) {
                      return Text(state.errorMassage);
                    } else {
                      return SizedBox(
                          height: 250.h,
                          child: CategoriesWidget(
                            category: viewmodel.categories,
                          ));
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<HomeTabViewmodel,HomeTabStates>(
                  bloc: viewmodel,
                  builder: (BuildContext context, HomeTabStates state) {
                    if (state is ProductSuccessState) {
                      return Column(
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("    ${viewmodel.randomCategoryEntity.name??""}",style: AppStyles.bold16primary,),
                              const Text("view all       "),
                            ],
                          ),
                          SizedBox(
                              height: 200.h,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                                itemCount: viewmodel.allProduct.length,
                                scrollDirection: Axis.horizontal
                                ,itemBuilder: (context, index) {
                                  return HomeProductWidget(
                                    imagePath: viewmodel.allProduct[index].imageCover!,
                                  );
                                }

                              )),
                        ],
                      );
                    } else if (state is ProductErrorState) {
                      return Text(state.errorMassage);
                    } else {
                      return const CircularProgressIndicator();
                    }

                  },

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
