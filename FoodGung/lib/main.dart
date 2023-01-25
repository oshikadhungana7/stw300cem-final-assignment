import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_login/constants.dart';
import 'package:new_login/object_box/ObjectBox.dart';
import 'package:new_login/responsive/home_layout.dart';
import 'package:new_login/responsive/login_layout.dart';
import 'package:new_login/screens/Cart/cart_provider.dart';
import 'package:new_login/screens/Cart/cart_screen.dart';
import 'package:new_login/screens/DetailsPage/ItemPage.dart';
import 'package:new_login/screens/Map/map.dart';
import 'package:new_login/screens/OrderHistory/order_details.dart';
import 'package:new_login/screens/OrderHistory/order_history.dart';
import 'package:new_login/screens/ProductDetails/components/product_details.dart';
import 'package:new_login/screens/Reviews/review.dart';
import 'package:new_login/screens/Shipping/confirmOrder.dart';
import 'package:new_login/screens/Shipping/shipping_details.dart';

import 'package:new_login/screens/SignUp/sign_up_screen.dart';
import 'package:new_login/screens/WearOs/wear_home.dart';
import 'package:new_login/screens/WearOs/wear_login.dart';
import 'package:new_login/screens/welcome/welcome_screen.dart';
import 'package:new_login/sensor/accelerometer.dart';
import 'package:new_login/sensor/dashboard.dart';
import 'package:new_login/sensor/gyroscope.dart';
import 'package:new_login/sensor/proximity.dart';
import 'package:provider/provider.dart';


const String API_BOX = "api_data";
void main() async{
  Stripe.publishableKey ="pk_test_51LHVGsC4uIJGIUxCLgn0V0O9DDJqLq55UUo7oGq5RFVpBsqSXyyqDasHp5ZGjoFwZncCkpu0I8BIGoaLgToYnc2500p5khjDqk";
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(API_BOX);
  AwesomeNotifications().initialize('resource://drawable/launcher', [
    NotificationChannel(
      channelGroupKey: 'basic_channel_group',
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      importance: NotificationImportance.Max,
      ledColor: Colors.white,
      channelShowBadge: true,
      channelDescription: 'Notification for the basic test of the app',
    ),
  ]);
  ObjectBox.init();
  runApp( const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // final authController = AuthController();

  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (_) => CartProvider(),
     child: Builder(builder: (BuildContext context){
       return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),

      initialRoute: '/',
      routes: {
        '/wear':(context)=>  const WelcomeScreen(),
        
        '/signup':(context)=>const SignUpScreen(),
        '/login':(context)=>  const LoginLayout(),
        '/dashboard':(context)=>const HomeLayout(),
        '/productDetails':(context)=> ProductDetails(),
        '/order':(context)=> OrderHistory(),
        '/viewreview':(context)=>Reviews(),
        '/itemPage':(context)=>ItemPage(),
        '/productList':(context)=>const CartScreen(),
        '/shippingDetails':(context)=>const ShippingDetail(),
        '/confirmOrder':(context)=>const ConfirmOrder(),
        '/orderDetails':(context)=>const OrderDetails(),
        '/map':(context)=> const MapScreen(),
        '/':(context)=> const WearOsWatch(),
        '/we':(context)=> const WearHomePage(),
        // '/dash': (context) => const DashboardScreen(),
        // '/accelerometerScreen': (context) => const AccelerometerScreen(),
        // '/gyroscopeScreen': (context) => const GyroscopeScreen(),
        // '/proximityScreen': (context) => const ProximityScreen(),
        
        

      //   // '/dashboard': (context) => const DashboardScreen(),
      // '/accelerometerScreen': (context) => const AccelerometerScreen(),
      // '/gyroscopeScreen': (context) => const GyroscopeScreen(),
      // '/proximityScreen': (context) => const ProximityScreen(),


        // '/':(context)=>const SplashScreen()


      },
    );
     }),

   );
  
  }
}

