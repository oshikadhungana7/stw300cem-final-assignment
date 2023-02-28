import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:new_login/responsive/login_layout.dart';
import 'package:new_login/screens/HomePage/homepage.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('Login Test',(WidgetTester tester) async{
    await tester.pumpWidget(
       MaterialApp(
         routes:{
          '/dashboard':(context)=> const HomePage ()
        },
        home: const LoginLayout(),
      )
    );

      Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
      await tester.enterText(txtEmail, 'khadka03adrsh@gmail.com');
      Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
      await tester.enterText(txtPassword, 'Kdk@03adrsh');
      Finder btnSignIn = find.byKey(const ValueKey('btnSignIn'));
      await tester.dragUntilVisible(btnSignIn, find.byType(SingleChildScrollView),  const Offset(0, 70),);
      await tester.tap(btnSignIn);
      await tester.pumpAndSettle();
      expect(find.byType(Container),findsOneWidget);
      // expect(find.text("Login"), findsOneWidget);
  });
  
}