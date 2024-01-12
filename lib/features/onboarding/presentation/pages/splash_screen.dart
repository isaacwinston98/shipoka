import 'package:flutter/material.dart';
import 'package:shipoka/app/view/widget/busy_button.dart';
import 'package:shipoka/app/view/widget/input_field.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children :[
          Center(child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: BusyButton(title: 'Next', onTap: () {  }, ),

          )
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InputField(placeholder: 'Email', controller: null,),
          )
        ]
      )
    );
  }
}
