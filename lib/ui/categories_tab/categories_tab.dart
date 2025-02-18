
import 'package:e_commerce/ui/categories_tab/widget/product_item_widget.dart';
import 'package:e_commerce/ui/home_tab/widget/search_cart_widget.dart';
import 'package:e_commerce/ui/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoriesTab extends StatelessWidget {
  const CategoriesTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchCartWidget(),
              SizedBox(height: 15.h,),
              SizedBox(height: 6000.h,
                child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2
                ,childAspectRatio: 2/2.8,

                  crossAxisSpacing: 3,
                 mainAxisSpacing: 3
                ),
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: 20,
                     itemBuilder: (context, index) {
                      return InkWell(onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(),));
                      },
                          child: const ProductItemWidget());
                    },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
