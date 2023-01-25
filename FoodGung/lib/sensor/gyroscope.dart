// import 'dart:async';

// import 'package:all_sensors/all_sensors.dart';

// import 'package:flutter/material.dart';

// class GyroscopeScreen extends StatefulWidget {
//   const GyroscopeScreen({super.key});

//   @override
//   State<GyroscopeScreen> createState() => _GyroscopeScreenState();
// }

// class _GyroscopeScreenState extends State<GyroscopeScreen> {
//   List<double> _gyroscopeValue = [];
//   final List<StreamSubscription<dynamic>> _streamSubscription = [];

//   @override
//   void initState() {
//     _streamSubscription.add(gyroscopeEvents!.listen((event) {
//       setState(() {
//         _gyroscopeValue = [event.x, event.y, event.z];
//       });
//     }));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<String> gyroscope =
//         _gyroscopeValue.map((double v) => v.toStringAsFixed(1)).toList();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gyroscope'),
//       ),
//       body: Center(
//         child: Text(
//           'Gyroscope values:\n \n X: ${gyroscope[0]} , Y : ${gyroscope[0]} , Z : ${gyroscope[0]}',
//           style: const TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (final subscription in _streamSubscription) {
//       subscription.cancel();
//     }

//     super.dispose();
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Gyroscope'),
//     ),
//     body: const Center(
//       child: Text('Gyroscope'),
//     ),
//   );
// }