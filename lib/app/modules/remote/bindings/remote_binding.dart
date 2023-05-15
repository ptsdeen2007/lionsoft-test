import 'package:get/get.dart';

import '../controllers/remote_controller.dart';

class RemoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteController>(
      () => RemoteController(),
    );
  }
}
