// ignore_for_file: strict_raw_type

import 'dart:convert';

import 'package:runking_app/config/api.dart';

class AuthRepo {
  static Future loginUser(
    String userEmail,
    String userPassword,
  ) async {
    final returnData = await dio.post(
      'login',
      data: {
        'email': userEmail,
        'password': userPassword,
      },
    );

    return returnData;
  }

  static Future signUser({
    String? email,
    String? password,
    String? name,
    String? phone,
    String? cpf,
    String? rg,
    String? birthDate,
    String? image,
    String? gender,
  }) async {
    print({
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'cpf': cpf,
      'rg': rg,
      'image': image,
      'birthDate': birthDate,
      'gender': gender,
    });
    final returnData = await dio.post(
      'createuser',
      data: jsonEncode({
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
        'cpf': cpf,
        'rg': rg,
        'image': image,
        'birthDate': birthDate,
        'gender': gender,
      }),
    );

    return returnData;
  }
}
