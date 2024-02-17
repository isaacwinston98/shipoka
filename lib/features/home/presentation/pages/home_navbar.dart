import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/features/home/presentation/pages/home_screen.dart';
import 'package:shipoka/features/shipment/presentation/pages/create_shipment.dart';
import 'package:shipoka/features/track/presentation/pages/track_shipment.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const TrackShipment(),
      const CreateShipment(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(int index) {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.home,
         color: index == 1 ? AppColors.white : AppColors.red,
        ),
          title: "Home",

          activeColorPrimary: AppColors.primaryColor,
          //inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: AppColors.white,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
            AppAssets.truck,
            color: index == 2 ? AppColors.white : AppColors.red,
        ),
          title: "Track",
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        activeColorSecondary: AppColors.white,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        icon: SvgPicture.asset(
          AppAssets.create,
          color: _controller.index == 3 ? AppColors.white : AppColors.red,
        ),
        title: "Create ",
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: AppColors.white,
      //  inactiveColorPrimary: AppColors.black,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        icon: SvgPicture.asset(
          AppAssets.create,
          color: _controller.index == 3 ? AppColors.white : AppColors.red,
        ),
        title: "Create ",
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: AppColors.white,
        //  inactiveColorPrimary: AppColors.black,
      ),
    ];
  }

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 65,
      controller: _controller,
      padding: const NavBarPadding.all(0),
      screens: _buildScreens(),
      items: [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppAssets.home,
            color: _currentIndex == 0 ? AppColors.white : AppColors.inActiveIcon,
          ),
          title: "Home",

          activeColorPrimary: AppColors.primaryColor,
          //inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.white,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppAssets.truck,
            color: _currentIndex == 1 ? AppColors.white : AppColors.inActiveIcon,
          ),
          title: "Track",
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.white,
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            AppAssets.create,
            color: _currentIndex == 2 ? AppColors.white : AppColors.inActiveIcon,
          ),
          title: "Create Shipment",
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
          activeColorSecondary: AppColors.white,
        ),

      ],
      confineInSafeArea: false,
     backgroundColor: AppColors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, //
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, //
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style7,
      onItemSelected: (x){
        setState(() {
          _currentIndex = _controller.index;
        });
      },
    );
  }
}

