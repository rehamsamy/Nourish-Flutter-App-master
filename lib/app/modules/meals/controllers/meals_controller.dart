import 'package:get/get.dart';

class MealsController extends GetxController {
  RxInt selected = 0.obs;

  changeSelected(index) {
    selected.value = index;
  }
}
