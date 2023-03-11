// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';

class CheckinController extends GetxController {
  RxInt eventId = 0.obs;
  RxList athletesSelected = [].obs;
  RxList athletesSelectedData = [].obs;

  void addAthletesId(int id, Map athleteData) {
    if (athletesSelected.value.contains(id)) {
      athletesSelected.removeWhere((element) => element == id);
      athletesSelectedData.remove(athleteData);
    } else {
      athletesSelectedData.add(athleteData);
      athletesSelected.value.add(id);
    }
  }
}
