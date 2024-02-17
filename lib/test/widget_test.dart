
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shipoka/features/auth/presentation/pages/signup.dart';

void main() {

 testWidgets('Check if textfield works', (widgetTester)async{
   final emailField = find.byKey(const ValueKey('emailField'));
   final signUpButton = find.byKey(const ValueKey('SignupButton'));

   await widgetTester.pumpWidget(const MaterialApp(home: Signup()));
   await widgetTester.enterText(emailField, 'this is a text for testing ');
   await widgetTester.tap(signUpButton);
   await widgetTester.pump();

   expect(find.text('this is a text for testing '), findsOneWidget);


 });
}