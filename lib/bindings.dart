import 'package:get/get.dart';
import 'package:livro_livre/dashboard/dashboard_binding.dart';
import 'package:livro_livre/home/home_binding.dart';
import 'package:livro_livre/login/login_binding.dart';
import 'package:livro_livre/qr_scan/qr_scan_binding.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    HomeBindings().dependencies();
    LoginBindings().dependencies();
    DashboardBindings().dependencies();
    QrScanBindings().dependencies();
  }
}
