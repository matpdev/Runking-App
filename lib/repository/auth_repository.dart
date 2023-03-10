// ignore_for_file: strict_raw_type

import 'package:runking_app/config/api.dart';
import 'package:runking_app/globalController/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

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

  static Future signUser(
    String userEmail,
    String userPassword,
    String userName,
    String userPhone,
  ) async {
    try {
      final returnData = await dio.post(
        'signup',
        data: {
          'email': userEmail,
          'password': userPassword,
          'name': userName,
          'phone': userPhone,
        },
      );

      return returnData;
    } on DioError catch (e) {
      return e.response;
    }
  }

  static Future changeUserToUser({
    String? document,
    String? documentType,
    String? birthDate,
    String? description,
    String? openingYear,
    String? imageIcon,
    String? gender,
    String? houseCapacity,
    String? lat,
    String? long,
    String? state,
    String? city,
    String? district,
    String? address,
    String? number,
    String? zipcode,
  }) async {
    final userData = Get.put<UserController>(UserController());

    try {
      Response returnData = await dio.post(
        'user/makeuser',
        data: {
          "document": document,
          "documentType": documentType,
          "birthDate": birthDate,
          "description": description,
          "openingYear": openingYear,
          "imageIcon": imageIcon,
          "gender": gender,
          "houseCapacity": houseCapacity,
          "lat": lat,
          "long": long,
          "state": state,
          "city": city,
          "district": district,
          "address": address,
          "number": number,
          "zipcode": zipcode,
        },
        options: Options(
          headers: {"Authorization": "Bearer ${userData.userdata.value.token}"},
        ),
      );

      return returnData;
    } on DioError catch (e) {
      print({"============================>>>", e.response});
      return e.response;
    }
  }

  static Future changeUserToArtist({
    String? document,
    String? documentType,
    String? description,
    String? fantasyName,
    String? transferFee,
    String? cacheMin,
    String? cacheMax,
    String? lat,
    String? long,
    String? icon,
    List? type,
    List? style,
    String? account,
    String? agency,
    String? bank,
    String? accountType,
    String? instagramLink,
    String? facebookLink,
    String? tikTokLink,
    String? spotifyLink,
    String? websiteLink,
    String? youtubeLink,
    String? isAccepting,
    String? state,
    String? city,
    String? district,
    String? address,
    String? number,
    String? zipcode,
    String? birthDate,
    String? openingYear,
    String? imageIcon,
    String? gender,
    String? houseCapacity,
    int? artistTypeId,
  }) async {
    final userData = Get.put<UserController>(UserController());

    try {
      Response returnData = await dio.post(
        'user/makeartist',
        data: {
          "document": document,
          "documentType": documentType,
          "description": description,
          "fantasyName": fantasyName,
          "transferFee": transferFee,
          "cacheMin": cacheMin,
          "cacheMax": cacheMax,
          "lat": lat,
          "long": long,
          "icon": icon,
          "type": type,
          "style": style,
          "account": account,
          "agency": agency,
          "bank": bank,
          "account_type": accountType,
          "instagramLink": instagramLink,
          "facebookLink": facebookLink,
          "tikTokLink": tikTokLink,
          "spotifyLink": spotifyLink,
          "websiteLink": websiteLink,
          "youtubeLink": youtubeLink,
          "artistTypeId": artistTypeId,
          "isAccepting": isAccepting,
          "state": state,
          "city": city,
          "district": district,
          "address": address,
          "number": number,
          "zipcode": zipcode,
          "birthDate": birthDate,
          "openingYear": openingYear,
          "imageIcon": imageIcon,
          "gender": gender,
          "houseCapacity": houseCapacity,
        },
        options: Options(
          headers: {"Authorization": "Bearer ${userData.userdata.value.token}"},
        ),
      );

      return returnData;
    } on DioError catch (e) {
      print({"============================>>>", e.response});
      return e.response;
    }
  }
}
