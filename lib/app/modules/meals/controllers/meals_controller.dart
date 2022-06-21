import 'package:get/get.dart';

class MealsController extends GetxController {
  RxInt selected = 0.obs;
  RxInt categoryId = 0.obs;

  changeSelected(index) {
    selected.value = index;
  }

  changeCategoryId(id) {
    categoryId.value = id;
  }
}
