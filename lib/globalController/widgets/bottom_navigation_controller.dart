import 'package:get/get.dart';

class NavigationController extends GetxController {
  final Rx<int> indexSelected = 0.obs;

  int get getIndex => indexSelected.value;
  int setIndex(int val) => indexSelected.value = val;
}
