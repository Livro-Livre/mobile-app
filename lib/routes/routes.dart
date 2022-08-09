import 'package:get/get.dart';
import 'package:livro_livre/dashboard/dashboard_binding.dart';
import 'package:livro_livre/dashboard/dashboard_view.dart';
import 'package:livro_livre/login/login_binding.dart';
import 'package:livro_livre/login/login_view.dart';
import 'package:livro_livre/home/home_binding.dart';
import 'package:livro_livre/home/home_view.dart';
import 'package:livro_livre/qr_scan/qr_scan.dart';
import 'package:livro_livre/qr_scan/qr_scan_binding.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: '/home',
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => const DashboardView(),
      binding: DashboardBindings(),
    ),
    GetPage(
      name: '/qr_scan',
      page: () => const QrScanView(),
      binding: QrScanBindings(),
    ),
  ];
}
