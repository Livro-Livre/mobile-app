import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livro_livre/dashboard/dashboard_controller.dart';
import 'package:livro_livre/widgets/lbutton.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                LButton(
                  title: '-',
                  color: Colors.red,
                ),
                LButton(
                  title: '+',
                  color: Colors.blue,
                ),
              ],
            ),
            const Text(
              'UnB',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
