import 'package:get/instance_manager.dart';
import 'package:livro_livre/dashboard/dashboard_controller.dart';
import 'package:livro_livre/api/koha_api.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => DashboardController());
    Get.lazyPut(() {
      final KohaAPI kohaApi = KohaAPI();
      return DashboardController(kohaApi);
    });
  }
}
