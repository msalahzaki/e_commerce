import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/ui/categories_tab/categories_tab.dart';
import 'package:e_commerce/ui/favorite_tab/favorite_tab.dart';
import 'package:e_commerce/ui/home_tab/home_tab.dart';
import 'package:e_commerce/ui/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavoriteTab(),
    const ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => changeSelectedIndex(value),
            items: [
              CustomBottomNavBarItem(AppAssets.iconHome, "Home"),
              CustomBottomNavBarItem(AppAssets.iconCategory, "Category"),
              CustomBottomNavBarItem(AppAssets.iconWithList, "WishList"),
              CustomBottomNavBarItem(AppAssets.iconProfile, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

BottomNavigationBarItem CustomBottomNavBarItem ( String iconPath,
String title){
  return BottomNavigationBarItem(
    label: title,
    icon: ImageIcon(
    AssetImage(iconPath),
    color: AppColor.white,
  ),
    activeIcon: CircleAvatar(
      backgroundColor: AppColor.white,
      child: ImageIcon(
        AssetImage(iconPath),
        color: AppColor
            .primary,
      ),
    ),
  );
}


