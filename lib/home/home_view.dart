import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livro_livre/home/home_controller.dart';
import 'package:livro_livre/widgets/lbutton.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

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
              children: <Widget>[
                LButton(
                  title: '-',
                  color: Colors.red,
                  onTap: () => Get.toNamed('/qr_scan', arguments: '-'),
                ),
                LButton(
                  title: '+',
                  color: Colors.blue,
                  onTap: () => Get.toNamed('/qr_scan', arguments: '+'),
                ),
              ],
            ),
            const Text(
              'UnB\nFAC',
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
