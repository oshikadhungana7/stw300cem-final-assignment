
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:new_login/responsive/login_layout.dart';
import 'package:new_login/screens/SignUp/sign_up_screen.dart'; 

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('SignUp Test',(WidgetTester tester) async{
    await tester.pumpWidget(
       MaterialApp(
         routes:{
          '/login':(context)=> const LoginLayout ()
        },
        home: const SignUpScreen(),
      )
    );
      Finder txtName = find.byKey(const ValueKey('txtName'));
      await tester.enterText(txtName, 'mom');
      Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
      await tester.enterText(txtEmail, 'mom@gmail.com');
      Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
      await tester.enterText(txtPassword, 'mom@gmail.com');
      Finder btnSignup = find.byKey(const ValueKey('btnSignup'));
      await tester.dragUntilVisible(btnSignup, find.byType(SingleChildScrollView),  const Offset(0, 70),);
      await tester.tap(btnSignup);
      await tester.pumpAndSettle();
      expect(find.byType(SingleChildScrollView),findsOneWidget);
      // expect(find.text("Login"), findsOneWidget);
  });
  
}