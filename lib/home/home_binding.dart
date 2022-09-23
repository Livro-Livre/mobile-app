import 'package:get/instance_manager.dart';
import 'package:livro_livre/home/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
