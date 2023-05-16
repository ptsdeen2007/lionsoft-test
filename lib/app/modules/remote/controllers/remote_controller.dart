import 'package:get/get.dart';

class RemoteController extends GetxController {
  var waterSwich=true.obs;
  var brushSwich=false.obs;
  var isStarted=false.obs;

  var sliderValue=1.0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  navigatBack() {
    Get.back();
  }

  void watterSwichPressed(bool value) {
    waterSwich.toggle();
  }
  void brushSwichPressed(bool value) {
    brushSwich.toggle();
  }

  void changeState() {
    isStarted.toggle();
  }

  void chageSlider(double value) {
    sliderValue.value=value;
  }
}
