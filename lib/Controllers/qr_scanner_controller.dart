import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
import 'package:and_beyond/Utils%20and%20Services/storage_service.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerController extends GetxController {
  final MobileScannerController scannerController = MobileScannerController();
  bool isScanned = false;

  void handleScan(String code) {
    if (isScanned) return;
    isScanned = true;

    String finalUrl = code.startsWith('http') ? code : 'http://$code';
    Uri uri = Uri.parse(finalUrl);

    StorageService().addConnection(uri.host, uri.port.toString());
    Get.toNamed(AppRoutes.webview, arguments: finalUrl);
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
