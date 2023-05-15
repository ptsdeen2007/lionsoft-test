import 'package:get/get.dart';

class RootController extends GetxController {
  //TODO: Implement RootController

  final currentPage = 0.obs;
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
  void chagePage(int pageIndex){
    currentPage.value=pageIndex;
  }

}
