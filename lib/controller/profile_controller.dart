import 'package:get/get.dart';

class ProfileController extends GetxController {
  var selectedImagePath = ''.obs;

  void setImagePath(String path) {
    selectedImagePath.value = path;
  }
}
