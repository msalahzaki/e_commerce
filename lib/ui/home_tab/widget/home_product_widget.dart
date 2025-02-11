import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';

import 'package:flutter/material.dart';

class HomeProductWidget extends StatelessWidget {
  const HomeProductWidget({super.key, required this.imagePath});
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imagePath,
            placeholder: (context, url) =>  Center(
              child: CircularProgressIndicator(
                color: AppColor.grey,
              ),
            ),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(50)),
          child:
                 const ImageIcon(
                  AssetImage(AppAssets.iconWithList),


              )


        ),
      ],
    );
  }
}


