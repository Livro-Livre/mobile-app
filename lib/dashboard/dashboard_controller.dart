import 'package:get/get.dart';
import 'package:livro_livre/api/koha_api.dart';
import 'package:livro_livre/model/biblio_item.dart';

class DashboardController extends GetxController with StateMixin {
  String? title = 'Empréstimo de livro';
  BiblioItem? item;
  KohaAPI kohaApi;

  DashboardController(this.kohaApi);

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());

    if (Get.parameters["type"] == "+") {
      title = "Devolução de livro";
    }

    item = await kohaApi.getBiblioItem(Get.parameters["id"]!);

    change(null, status: RxStatus.success());
  }
}
