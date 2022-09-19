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
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Você está alugando:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'REGRAS',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('* - Lorem ipsum dolor sit amet'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('* - Consectetur adipiscing elit.'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('* - Maecenas non magna in libero.'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('* - In luctus quis turpis eu bibendum.'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('* - Vehicula eget ultricies seds.'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () async => Get.offAllNamed("/home"),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text('CANCELAR'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            onPressed: () async =>
                                FirestoreApi().addToBorrows(controller.item),
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
