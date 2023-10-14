import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_portfolio/core/class/status_request.dart';
import 'package:my_portfolio/core/function/checkinternet.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('amadytech:amadytech123456+_+'))}';
Map<String, String> myheaders = {'authorization': _basicAuth};

class Curd {
  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(link), body: data, headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          // print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }
}

// class Curd {
//   postData(String link,Map data) async {
//     try {
//       if (checkInternet()) {
//         var response = await http.post(Uri.parse(link), body: data);
//         var responsebody = jsonDecode(response.body);
//         return responsebody;
//       } else {
//         return StatusRequest.offline;
//       }
//     } catch (e) {
//       return StatusRequest.serverfailure;
//     }
//   }
// }
