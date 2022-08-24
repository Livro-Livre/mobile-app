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
              Get.offAndToNamed('/dashboard');
              // Get.bottomSheet(
              //   DraggableScrollableSheet(
              //     initialChildSize: 0.89, // half screen on load
              //     maxChildSize: 1.0, // full screen on scroll
              //     minChildSize: 0.7,
              //     builder: (a, b) => Container(
              //       height: Get.height,
              //       color: Colors.white,
              //       child: Padding(
              //         padding: const EdgeInsets.all(16.0),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: const [
              //                 Center(
              //                   child: Padding(
              //                     padding: EdgeInsets.all(16.0),
              //                     child: Text(
              //                       'REGRAS',
              //                       style: TextStyle(
              //                           fontSize: 24,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.all(8.0),
              //                   child: Text('* - Lorem ipsum dolor sit amet'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.all(8.0),
              //                   child: Text('* - Consectetur adipiscing elit.'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.all(8.0),
              //                   child:
              //                       Text('* - Maecenas non magna in libero.'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.all(8.0),
              //                   child: Text(
              //                       '* - In luctus quis turpis eu bibendum.'),
              //                 ),
              //                 Padding(
              //                   padding: EdgeInsets.all(8.0),
              //                   child:
              //                       Text('* - Vehicula eget ultricies seds.'),
              //                 ),
              //               ],
              //             ),
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: [
              //                 const Center(
              //                   child: Padding(
              //                     padding: EdgeInsets.all(8.0),
              //                     child: Text(
              //                       'Você está alugando:',
              //                       style: TextStyle(
              //                           fontSize: 24,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //                 Center(
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text(
              //                       code.replaceAll('livro:', ''),
              //                       style: const TextStyle(
              //                           fontSize: 24,
              //                           fontWeight: FontWeight.bold),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: OutlinedButton(
              //                     onPressed: () async => Get.arguments == '+'
              //                         ? Get.offAndToNamed('/dashboard')
              //                         : Get.offAndToNamed('/qr_scan'),
              //                     child: const Padding(
              //                       padding: EdgeInsets.all(16.0),
              //                       child: Text('CANCELAR'),
              //                     ),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: OutlinedButton(
              //                     onPressed: () async => Get.arguments == '+'
              //                         ? Get.offAndToNamed('/dashboard')
              //                         : Get.offAndToNamed('/qr_scan'),
              //                     child: const Padding(
              //                       padding: EdgeInsets.all(16.0),
              //                       child: Text('CONFIRMAR'),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              //   isScrollControlled: true,
              // );
            }
          }
        },
      ),
    );
  }
}
