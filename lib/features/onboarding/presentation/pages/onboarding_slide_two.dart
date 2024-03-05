import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import '../widget/onboarding_slide.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Automatically slide to the next page after every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  // Function to handle the next button function
  void _handleNextButton() {
    if (_currentPage < 2) {
      // If not on the last slide, go to the next slide
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // If on the last slide, navigate to the SignUp Page
      // You can replace the following line with your navigation logic
      Navigator.pushNamed(context, RouteName.signUpTwo);
    }
  }

// Build the small menu as a circle
  Widget _buildMenu() {
    final double activeCircleWidth = 30.0; // Width of the active circle

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
            (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: _currentPage == index
              ? Container(
            width: activeCircleWidth,
            height: 10.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0), // Apply border radius for the active circle
              color: AppColors.primaryColor,
            ),
          )
              : Container(
            width: 18.0,
            height: 10.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Ensure inactive circles remain round
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // the onboarding slides
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: 3, // Set the total number of pages
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: OnboardingSlide(
                    imagePath: index == 0
                        ? AppAssets.onboardingSlide1
                        : index == 1
                        ? AppAssets.onboardingSlide2
                        : AppAssets.onboardingSlide3,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              _currentPage == 0
                  ? 'We provide professional delivery services for you'
                  : _currentPage == 1
                  ? 'Your satisfaction is our priority'
                  : 'Let’s make your day great with Shipoka!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height:30),
          _buildMenu(),
          const SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 25),
            child: ElevatedButton(
              onPressed: _handleNextButton,
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                onPrimary: AppColors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(_currentPage <= 1 ? 'Next' : 'Next'),
            ),
          ),
          const SizedBox(height:25),
        ],
      ),
    );
  }
}
