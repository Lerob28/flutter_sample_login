import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final loginfield = TextEditingController();
  final passwordfield = TextEditingController();

  void loginAPI() async {
    const String APIurl = 'https://reqres.in/api/login';
    final bodyRequest = {
      "email": loginfield.text.toString(),
      "password": passwordfield.text.toString(),
    };

    print('Request initiated ...');
    print(bodyRequest);
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar('Login Successfull', 'Congratulation');
      } else {
        Get.snackbar('Login Failled', 'maybe a Server trouble');
      }
    } catch (e) {
      Get.snackbar('Exception occured', e.toString());
    } finally {
      print('Request succefuly terminated');
    }
  }
}
