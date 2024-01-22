import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const HomeScreen(),
      const TrackShipment(),
      const CreateShipment(),
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: AppColors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: _currentIndex,
        enableFeedback: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.home,
              height: 20,
              width: 20,
              color: AppColors.textSecondaryColor,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.home,
              height: 20,
              width: 20,
              color: AppColors.textColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.home,
              height: 20,
              width: 20,
              color: AppColors.textSecondaryColor,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.home,
              height: 20,
              width: 20,
              color: AppColors.textColor,
            ),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.home,
              height: 20,
              width: 20,
              color: AppColors.textSecondaryColor,
            ),
            activeIcon: SvgPicture.asset(
              AppAssets.home,
              height: 20,
              width: 20,
              color: AppColors.textColor,
            ),
            label: 'Create New Shipment',
          ),
        ],
      ),
    );
  }
}
