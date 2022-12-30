import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_login/screens/Cart/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';
import '../../models/shipping_model.dart';
import '../Cart/cart_provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:http/http.dart' as http;


class ConfirmOrder extends StatefulWidget {
  
  const ConfirmOrder({Key? key}) : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  Map<String,dynamic>? paymentIntentData;
  String? address;
  var city;
  var pincode;
  var phone;
  var country;
  var state;
  double? getTotalAmount;

  DBHelper? dbHelper = DBHelper();
  void getTotal() async{
    SharedPreferences preferences =await SharedPreferences.getInstance();
    setState(() {
      getTotalAmount = preferences.get('total_price') as double?;
      print(getTotalAmount);
    });
  }

 
   @override
  void initState() {
    super.initState();
    ShippingModel shippingData = ShippingModel();
    // ShippingModel model = shippingData.getAllData() as ShippingModel;
    shippingData.getAllData().then((value) {
      setState(() {
        address =value.address.toString();
        city=value.city.toString();
        pincode=value.pincode.toString();
        phone = value.phone.toString();
        country = value.country.toString();
        state = value.state.toString();
        print(address);
      });
    });
    getTotal();
  }
  @override
  Widget build(BuildContext context) {
     final cart  = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
        centerTitle: true,
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: Container(
        child: Column(
       

          children: [
                SizedBox(height: 20,),
                Text("Your Cart Items",style:TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  
                )
                ,),

               FutureBuilder(
              future:cart.getData() ,
                builder: (context , AsyncSnapshot<List<Cart>> snapshot){
                if(snapshot.hasData){

                  if(snapshot.data!.isEmpty){
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('assets/images/emptycart.png'),
                          ),
                          SizedBox(height: 20,),
                          Text('Your cart is empty 😌' ,style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 20,),
                          Text('Explore products and shop your\nfavourite items' , textAlign: TextAlign.center ,style: Theme.of(context).textTheme.subtitle2)

                        ],
                      ),
                    );
                  }else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image(
                                          height: 100,
                                          width: 100,
                                          image: NetworkImage(snapshot.data![index].image.toString()),
                                        ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(snapshot.data![index].productName.toString() ,
                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                  ),
                                                  // InkWell(
                                                  //     onTap: (){
                                                  //       dbHelper!.delete(snapshot.data![index].id!);
                                                  //       cart.removerCounter();
                                                  //       cart.removeTotalPrice(double.parse(snapshot.data![index].productPrice.toString()));
                                                  //     },
                                                  //     child: Icon(Icons.delete))
                                                ],
                                              ),

                                              SizedBox(height: 5,),
                                              Text("Rs"+ snapshot.data![index].productPrice.toString() ,
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                              ),
                                              SizedBox(height: 5,),
                                              Align(
                                                alignment: Alignment.centerRight,
                                        
                                              )
                                            ],
                                          ),
                                        )

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }

                }
              return Text('') ;
            }),
            Divider(
          color: Colors.black,
          height: 20,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
           Text('Shipping Info',style:TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  
                )),
           Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("Address:\t",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                            Text("${address}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                          ],
                        ),     
                      ),
                      SizedBox(height: 10,),
                      Container(
                         child: Row(
                          children: [
                            Text("Phone:\t",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text("${phone}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                          ],
                        ),  
                      ),
                       SizedBox(height: 10,),
                      Container(
                         child: Row(
                          children: [
                            Text("PinCode:\t",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text("${pincode}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                          ],
                        ),  
                      )
                      
                    ],
                  ),
                ),
              ),
            ),
           ),
           Divider(
          color: Colors.black,
          height: 20,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
         Text('Order Summary',style:TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  
                )),
         Container(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("SubTotal:\t",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                            Text("${getTotalAmount}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                          ],
                        ),     
                      ),
                      SizedBox(height: 10,),
                      Container(
                         child: Row(
                          children: [
                            Text("Shipping Charges:\t",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text("0",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                          ],
                        ),  
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
        ),
                      SizedBox(height: 10,),
                      Container(
                        
                         child: Row(
                          children: [
                            Text("Total:\t",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text("${getTotalAmount}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                          ],
                        ),  
                      ),
            
                    ],
                  ),
                ),
              ),
            ),
           ),
           Divider(
          color: Colors.black,
          height: 20,
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
         ElevatedButton.icon(

              onPressed: () async{
                await makePayment(getTotalAmount!.toStringAsFixed(0).toString());
                // Navigator.pushNamed(context, '/confirmOrder');            
              }, 
              
              icon: Icon(Icons.confirmation_number),
              label: Text(
                "Procced to Payment",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 13,horizontal: 15)
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                )
                  
               ),
              )
            
          ],
          
        ),
        
      ),
    );
  }
  Future<void> makePayment(String? total) async {
    // paymnet instant method

    try {
      paymentIntentData = await createPaymentIntent(
          total.toString(), 'INR'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await stripe.Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: stripe.SetupPaymentSheetParameters(
            customerId: paymentIntentData!['customer'] ?? 'Customer',
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: 'ANNIE',
          ))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await stripe.Stripe.instance
          .presentPaymentSheet(
              parameters: stripe.PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        // print(
        //     'payment intent iddddddddd' + paymentIntentData!['id'].toString());
        // print('Statussssssssssssssssssss' +
        //     paymentIntentData!['status'].toString());

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));
        // Navigator.pushNamed(context, Navbar.routeName);

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on stripe.StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51LHVGsC4uIJGIUxCV3KG3Pg7VPAEMRntXPn7mAwtBqehKkt1RAA4Oxl5czMphH2lfxnIlgZQWaKpZlf1WL4VKgBa000h5nU8Vx',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}