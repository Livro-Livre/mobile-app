import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            OutlinedButton(
              onPressed: () async => controller.kohaApi.login(),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Logar'),
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                Map<String, dynamic> res = await controller.kohaApi.getItem(494);
                print(res);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Consultar 494'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
