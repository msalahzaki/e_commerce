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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22), // Slightly larger to match clip
            border: Border.all(color: AppColor.darkBlue, width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Must match to clip properly
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imagePath.isNotEmpty ? imagePath : 'https://via.placeholder.com/150',
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(color: AppColor.grey),
              ),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
            ),
          ),
        ),


        Positioned(right: 8,top: 4,
          child: Container(clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(50)),
            child:
                    ImageIcon(
                    const AssetImage(AppAssets.iconWithList),color: AppColor.darkBlue,


                )


          ),
        ),
      ],
    );
  }
}


