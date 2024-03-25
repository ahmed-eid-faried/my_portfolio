// checkInternet() async {
//   try {
//     List<InternetAddress> response = await InternetAddress.lookup("google.com");
//     if (response.isNotEmpty && response.first.rawAddress.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     return false;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// Future<bool> checkInternet() async {
//   try {
//     final InternetConnectionStatus status =
//         await InternetConnectionChecker().connectionStatus;
//     return status == InternetConnectionStatus.connected;
//   } catch (e) {
//     debugPrint('Error checking internet connectivity: $e');
//     return false;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<bool> checkInternet() async {
//   try {
//     final response =
//         await http.get(Uri.parse('https://www.google.com/'));
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   } catch (e) {
//     debugPrint('Error checking internet connectivity: $e');
//     return false;
//   }
// }
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
Future<bool> checkInternet() async {
  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  } catch (e) {
    debugPrint('Error checking internet connectivity: $e');
    return false;
  }
}
