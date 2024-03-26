import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/class/status_request.dart';
import 'package:my_portfolio/core/function/checkinternet.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('amadytech:amadytech123456+_+'))}';
Map<String, String> myheaders = {'authorization': _basicAuth};

class Curd {
  static final Map<String, String> myheaders = {
    // 'authorization': _basicAuth,
    //  'Content-Type': 'application/json',
    // 'Access-Control-Allow-Origin': '*', // CORS headers
    // 'Access-Control-Allow-Methods': 'GET,POST,PUT,UPDATE,PATCH,DELETE,OPTIONS',
    // // // 'Access-Control-Allow-Headers': 'Content-Type, Authorization',
    // 'Access-Control-Allow-Headers':
    //     'Content-Type,Access-Control-Allow-Headers,Authorization,X-Requested-With,Access-Control-Allow-Origin',
  };

  Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(link), body: data, headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          debugPrint(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      debugPrint(e.toString());
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
      String link, Map<String, String> data) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(link), headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          debugPrint(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      debugPrint(e.toString());
      return const Left(StatusRequest.serverException);
    }
  }
}
