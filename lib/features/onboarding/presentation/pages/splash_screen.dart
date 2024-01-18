import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shipoka/features/onboarding/presentation/pages/onboarding_screen.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({super.key});

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> with SingleTickerProviderStateMixin {


  @override
  void initState (){
    super.initState();
   // After a delay, navigate to the onboarding screen
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize background color as needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 20.0),
            // Rotating circles animation
            Stack(
              alignment: Alignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, ),
                  child: Image.asset(
                    'assets/images/splashCircle.png', // Replace with your circles image path
                  ),
                ),
                // Your fixed logo
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png', // Replace with your logo image path
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Shipoka',
                      style: TextStyle(
                        fontSize: 26.0, // Adjust the font size as needed
                        fontWeight: FontWeight.w700,
                        color: Colors.black, // Adjust the text color as needed
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}