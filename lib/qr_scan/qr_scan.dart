import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livro_livre/qr_scan/qr_scan_controller.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanView extends GetView<QrScanController> {
  const QrScanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title!),
      ),
      body: MobileScanner(
        allowDuplicates: false,
        onDetect: (barcode, args) {
          if (barcode.rawValue == null) {
            debugPrint('Failed to scan Barcode');
          } else {
            final String code = barcode.rawValue!;
            debugPrint('Barcode found! $code');
            if (code.contains('livro')) {
              Get.offAndToNamed('/dashboard', parameters: {
                "id": code.replaceAll("livro", ""),
                "type": Get.arguments
              });
            }
          }
        },
      ),
    );
  }
}
