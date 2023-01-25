// import 'dart:async';

// import 'package:all_sensors/all_sensors.dart';
// import 'package:flutter/material.dart';

// class ProximityScreen extends StatefulWidget {
//   const ProximityScreen({super.key});

//   @override
//   State<ProximityScreen> createState() => _ProximityScreenState();
// }

// class _ProximityScreenState extends State<ProximityScreen> {
//   double _proximityValue = 0;
//   final List<StreamSubscription<dynamic>> _streamSubscription = [];

//   @override
//   void initState() {
//     _streamSubscription.add(proximityEvents!.listen((event) {
//       setState(() {
//         _proximityValue = event.proximity;
//       });
//     }));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     for (final subscription in _streamSubscription) {
//       subscription.cancel();
//     }

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Proximity'),
//         ),
//         body: Center(
//           child: _proximityValue >= 4
//               ? const Text(
//                   'Object is far',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//               : const Text(
//                   'Object is near',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//         ));
//   }
// }