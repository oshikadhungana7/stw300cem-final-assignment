import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import 'package:new_login/repository/order_repository.dart';
import 'package:new_login/screens/OrderHistory/order_history.dart';
import 'package:new_login/screens/UserProfile/components/profileMenu.dart';
import 'package:new_login/screens/UserProfile/components/profilePic.dart';
import 'package:shake/shake.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';
import '../../../repository/user_repository.dart';




class Body extends StatefulWidget {
  
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
   late TextEditingController _controller;
   late TextEditingController _controller1;
   var _oldPasswordcontroller = TextEditingController() ;
   var _newPasswordcontroller = TextEditingController() ;
   var _confirmPasswordcontroller = TextEditingController() ;  

   void preferences() async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();  
      var data =sharedPreferences.getString('userdata');
      print('dassssssssadssssssssssssssssssdasssssssssssssssssssssdasssssssssssssssssssssssssss');
      Map<String,dynamic> encodedData = jsonDecode(sharedPreferences.getString('userdata')!);
      User user = User.fromJson(encodedData);
       _controller = TextEditingController(text: user.name);
       _controller1 = TextEditingController(text: user.email);
      print(user.name);
      
      // print(data);

    }
    ShakeDetector? detector;

    @override
  void initState() {

    super.initState();

    preferences();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() {
          logout();
        });
      },
    );
    
  }

  void dispose() {
    detector!.stopListening();
    super.dispose();
  }

  _orderHistory() async{
    try{
      OrderRepository orderRepository = OrderRepository();
      String orderHistory = await orderRepository.getOrderHistory().toString();
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();  
      var data =sharedPreferences.getString('userdata');
    }
    catch (e){
      MotionToast.error(
        description: Text("Error: ${e.toString()}"),).show(context);
    }
  }

   _updateUser() async{
    try{
      UserRepository userRepository = UserRepository();
      bool isUpdate = await userRepository.updateProfile(
       _controller.text,
       _controller1.text
        );
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.remove('userdata');
        User user = User(
          name: _controller.text,
          email: _controller1.text
        );
        print(user.name);
         String userdata = jsonEncode(user);
         preferences.setString('userdata'
          , "$userdata");
    }
    
    catch(e){
      MotionToast.error(
        description: Text("Error:${e.toString()}"),
      ).show(context);
    }
    Navigator.pop(context);
  }

  _changePassword() async {
    try{
      UserRepository userRepository = UserRepository();
      bool changePassword = await userRepository.changePassword(
       _oldPasswordcontroller.text,
       _newPasswordcontroller.text,
       _confirmPasswordcontroller.text
        );

      User user = User(
          password: _oldPasswordcontroller.text,        
        );
        
    }
    
    catch(e){
      MotionToast.error(
        description: Text("Error:${e.toString()}"),
      ).show(context);
    }
     Navigator.pop(context);
  }
  

   void logout() async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.remove('token');
      // preferences.remove('cart_item');
      // preferences.remove('total_price');
      Navigator.pushNamed(context, '/login');

  }
 void showDial() {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: SimpleDialog(
                title: const Center(child: Text("My Account")),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: Column(
                        children: [
                      TextFormField(
                        controller: _controller,
                        onChanged: (value){
                          setState(() {
                            _controller.text =value ;
                          });
                        },
                            

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                        labelText: "Name"
                      )
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _controller1,
                      onChanged: (value){
                        _controller1.text = value;
                        
                      },
                    
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your email",
                        labelText: "Email"
                      )
                    ),
                    ElevatedButton(onPressed: (){_updateUser();}, child: const Text("Update Profile"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4C53A5)
                      ),)
                        ],
                      ),
                    ),
                  )
                  
                ],
              ),
            );
            
          });
    }

     void showDial1() {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: SimpleDialog(
                title: const Center(child: Text("Change Password")),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: Column(
                        children: [
                      TextFormField(
                        controller: _oldPasswordcontroller,     
                        decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Old Password",
                        labelText: "OldPassword"
                      )
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _newPasswordcontroller,
                    
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter new password",
                        labelText: "NewPassword"
                      )
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _confirmPasswordcontroller,     
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter confirm password",
                        labelText: "ConfirmPassword"
                      )
                    ),
                    ElevatedButton(onPressed: (){_changePassword();}, child: const Text("Change Password"),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4C53A5)
                      ),)
                        ],
                      ),
                    ),
                  )
                  
                ],
              ),
            );
            
          });
    }

      void orderHistory() {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: SimpleDialog(
                title: const Center(child: Text("Order History")),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      child: Column(
                        children: [
                          ElevatedButton(onPressed: (){Navigator.pushNamed(context, OrderHistory.routeName);}, child: Text("Show History"))
                        ],
                      ),
                    ),
                  )
                  
                ],
              ),
            );
            
          });
    }

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/user-solid.svg",
            press: () => {
              showDial()
            },
          ),
         
          ProfileMenu(
            text: "Change Password",
            icon: "assets/icons/gears-solid.svg",
            press: () {
              showDial1();
            },
          ),
          ProfileMenu(
            text: "My Order History",
            icon: "assets/icons/circle-info-solid.svg",
            press: () {
              Navigator.pushNamed(context, '/order');
            },
          ),
         Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF4C53A5),
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          
        ),
        onPressed: (){
          logout();
        },
        child: Row(
          children: const [
            Padding(padding: EdgeInsets.only(right: 120)),
            Text("Logout"),
            SizedBox(width: 100,),
           
            SizedBox(width: 20),
          ],
        ),
      ),
    )
        ],
      ),
    );
  }
}