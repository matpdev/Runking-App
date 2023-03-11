import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:runking_app/config/api.dart';
import 'package:runking_app/globalController/user_controller.dart';

class CheckinRepo {
  static Future getEvents() async {
    final userData = Get.put<UserController>(UserController());

    Response response = await dio.get(
      "eventsCheckin",
      options: Options(
        headers: {
          "Authorization": userData.userdata.value.token,
        },
      ),
    );

    return response;
  }

  static Future getAthelesByEvent(int eventId) async {
    final userData = Get.put<UserController>(UserController());

    Response response = await dio.get(
      "eventsAthetes/$eventId",
      options: Options(
        headers: {
          "Authorization": userData.userdata.value.token,
        },
      ),
    );

    return response;
  }

  static Future getThirdParty(int eventId, String search) async {
    final userData = Get.put<UserController>(UserController());

    Response response = await dio.get(
      "seekThirdParty/$eventId?name=$search",
      options: Options(
        headers: {
          "Authorization": userData.userdata.value.token,
        },
      ),
    );

    return response;
  }

  static Future authThirdParty(int eventId, userId) async {
    final userData = Get.put<UserController>(UserController());

    Response response = await dio.post(
      "seekThirdParty/$eventId",
      data: {"id": userId},
      options: Options(
        headers: {
          "Authorization": userData.userdata.value.token,
        },
      ),
    );

    return response;
  }

  static Future checkinQrCode(int returnIdCode, List users) async {
    final userData = Get.put<UserController>(UserController());

    Response response = await dio.post(
      "checkin",
      data: {
        "print": returnIdCode,
        "athletes": users,
      },
      options: Options(
        headers: {
          "Authorization": userData.userdata.value.token,
        },
      ),
    );

    return response;
  }
}
