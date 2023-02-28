import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_login/screens/Login/login_screen.dart';
import 'package:new_login/screens/SignUp/sign_up_screen.dart';
import 'package:new_login/screens/welcome/welcome_screen.dart';

void main() {
  group("Welcome Screen Widget Test", (){
         testWidgets("Welcome Screen Widget Testing", (WidgetTester tester) async{
      await tester.pumpWidget(
        const MaterialApp(
            home: WelcomeScreen()
        )
      );
      Finder ElevatedButton = find.text("LOGIN");
      expect(ElevatedButton, findsOneWidget);
  });
  testWidgets("Welcome Screen Widget Testing2", (WidgetTester tester) async{
      await tester.pumpWidget(
        const MaterialApp(
          home: WelcomeScreen(),
        )
      );
      Finder ElevatedButton = find.text("SignUp");
      expect(ElevatedButton, findsOneWidget);
  });

  testWidgets("SignUp test", (WidgetTester tester) async{
      await tester.pumpWidget(
          MaterialApp(
              routes: {
                '/login':(context)=>const LoginScreen()
              },
              home: const SignUpScreen(),
          )
      );
      Finder txtName = find.byKey(const ValueKey('txtName'));
      await tester.enterText(txtName, 'adarsha');
      Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
      await tester.enterText(txtEmail, 'adarsha77@gmail.com');
      Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
      await tester.enterText(txtPassword, 'adarsha12345');
      Finder btnSignup = find.byKey(const ValueKey('btnSignup'));
      await tester.dragUntilVisible(btnSignup, find.byType(SingleChildScrollView),  Offset(0, 50),);
      await tester.tap(btnSignup);
      await tester.pumpAndSettle();
      expect(find.text("Result"), findsOneWidget);
  });

  });
 
}