import 'package:get/get.dart';

import '../controllers/reciept_preview_controller.dart';

class RecieptPreviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecieptPreviewController>(
      () => RecieptPreviewController(),
    );
  }
}
