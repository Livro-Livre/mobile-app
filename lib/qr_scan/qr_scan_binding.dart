import 'package:get/instance_manager.dart';
import 'package:livro_livre/qr_scan/qr_scan_controller.dart';

class QrScanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrScanController());
  }
}
