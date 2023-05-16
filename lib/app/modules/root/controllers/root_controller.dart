import 'package:get/get.dart';
import 'package:lionsbot_task/app/routes/app_pages.dart';

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
    if(pageIndex==1){
      Get.toNamed(Routes.REMOTE);
      return;
    }
    currentPage.value=pageIndex;
  }

}
