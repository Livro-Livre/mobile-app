import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livro_livre/bindings.dart';
import 'package:livro_livre/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Livro Livre',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      initialBinding: AppBindings(),
      getPages: AppRoutes.pages,
    );
  }
}
