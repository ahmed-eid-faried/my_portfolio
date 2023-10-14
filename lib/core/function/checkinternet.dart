// import 'dart:io';

// checkInternet() async {
//   try {
//     List<InternetAddress> response = await InternetAddress.lookup("google.com");
//     if (response.isNotEmpty && response[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     return false;
//   }
// }

// import 'package:internet_connection_checker/internet_connection_checker.dart';
// Future<bool> checkInternet() async {
//   final InternetConnectionStatus status =
//       await InternetConnectionChecker().connectionStatus;
//   return status == InternetConnectionStatus.connected;
// }

import 'package:http/http.dart' as http;

Future<bool> checkInternet() async {
  try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com'));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('Error checking internet connectivity: $e');
    return false;
  }
}
