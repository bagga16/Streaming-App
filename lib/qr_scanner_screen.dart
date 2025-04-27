import 'package:and_beyond/Controllers/qr_scanner_controller.dart';
import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatelessWidget {
  final QRScannerController controller = Get.put(QRScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: controller.scannerController,
            // onScannerStarted: () {
            //   debugPrint('Scanner started');
            // },
            onDetect: (BarcodeCapture capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.format == BarcodeFormat.qrCode) {
                  final String? code = barcode.rawValue;
                  if (code != null) {
                    controller.handleScan(code);
                  }
                }
              }
            },
          ),
          Positioned(
            top: 40,
            left: 20,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.9),
              ),
              onPressed: () {},
              icon: Icon(Icons.qr_code, color: Colors.blue),
              label: Text("Scanning QR...", style: TextStyle(color: Colors.blue)),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              onPressed: () => Get.offAllNamed(AppRoutes.join),
              child: Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }
}
