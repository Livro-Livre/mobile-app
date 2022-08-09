import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livro_livre/login/login_controller.dart';
import 'package:livro_livre/widgets/lbutton.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Usúario',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Senha',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: OutlinedButton(
                    onPressed: () async => Get.arguments == '+'
                        ? Get.offAndToNamed('/dashboard')
                        : Get.offAndToNamed('/qr_scan'),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('ENTRAR'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
