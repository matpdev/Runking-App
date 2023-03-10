import 'package:runking_app/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<UserModel> userdata = UserModel().obs;
  final Rx<int> artistType = 0.obs;

  void setUserData(Map<String, dynamic> userData) {
    userdata.value.setData(userData);
  }

  UserModel get getUserdata => userdata.value;
}
