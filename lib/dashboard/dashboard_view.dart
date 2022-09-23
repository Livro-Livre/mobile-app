import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livro_livre/api/firestore_api.dart';
import 'package:livro_livre/dashboard/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            controller.obx((state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Get.parameters['type'] == '+'
                                ? const Text(
                                    'Você está devolvendo:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const Text(
                                    'Você está alugando:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.item!.getFullName(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Get.parameters['type'] == '-'
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Text(
                                    'REGRAS',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('1 - Cuide bem do livro.'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('2 - Não empreste para terceiros.'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    '3 - Tente devolver assim que terminar a leitura.'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    '4 - Ao devolver, escaneie o qr-code no modo devolução.'),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 32.0),
                          child: OutlinedButton(
                            onPressed: () async =>
                                await Get.offAllNamed("/home"),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('CANCELAR'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () async {
                              if (Get.parameters['type'] == '+') {
                                FirestoreApi().markAsReturned(controller.item);
                                await Get.offAllNamed("/home");
                              } else {
                                FirestoreApi().addToBorrows(controller.item);
                                await Get.dialog(
                                  const Center(
                                    child: SizedBox(
                                      width: 200,
                                      height: 160,
                                      child: Card(
                                        child: Center(
                                          child: Text(
                                            'Obrigado!',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                                await Get.offAllNamed("/home");
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('CONTINUAR'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }, onLoading: const CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
