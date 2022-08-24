import 'package:get/get.dart';
import 'package:livro_livre/api/koha_api.dart';

class DashboardController extends GetxController {
  String? title = 'Livro Livre';
  String? itemType;
  KohaAPI kohaApi;
  DashboardController(this.kohaApi);
}
