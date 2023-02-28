// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:new_login/screens/Shipping/shipping_details.dart';


// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
//   testWidgets('Shipping Test', (WidgetTester tester) async{
//     await tester.pumpWidget(
//       MaterialApp(
//         routes: {
//           '/shippingDetails':(context)=> const ShippingDetail()
//         },
//         home:  const ShippingDetail(),
//       )
//     );
//       Finder address = find.byKey(const ValueKey('address'));
//       await tester.enterText(address, 'Sukedhara');
//       Finder city = find.byKey(const ValueKey('city'));
//       await tester.enterText(city, 'Kathmandu');
//       Finder pincode = find.byKey(const ValueKey('pincode'));
//       await tester.enterText(pincode, '1234');
//       Finder phone = find.byKey(const ValueKey('phone'));
//       await tester.enterText(phone, '9840338963');
//       Finder country = find.byKey(const ValueKey('country'));
//       await tester.enterText(country, 'Nepal');
//       Finder state = find.byKey(const ValueKey('state'));
//       await tester.enterText(state, 'Bagmati');
//       Finder btnShipping = find.byKey(const ValueKey('btnShipping'));
//       await tester.dragUntilVisible(btnShipping, find.byType(Scaffold),  const Offset(0, 70),);
//       await tester.tap(btnShipping);
//       await tester.pumpAndSettle();
//       expect(find.byType(Scaffold),findsOneWidget);

      
//   });
// }