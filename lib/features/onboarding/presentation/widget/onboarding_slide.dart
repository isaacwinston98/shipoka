

import 'package:flutter/cupertino.dart';

class OnboardingSlide  extends StatelessWidget {
  final String imagePath;

  OnboardingSlide({required this.imagePath,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height:100,
      child: Image.asset(imagePath),
    );
  }
}