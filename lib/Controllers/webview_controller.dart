import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class WebviewController extends GetxController {
  late WebViewController webviewController;
  var isLoading = true.obs;
  String url = '';

  void initializeWebview() {
    webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => isLoading(true),
          onPageFinished: (url) => isLoading(false),
        ),
      )
      ..loadRequest(Uri.parse(url));

    WakelockPlus.enable();
  }

  void refreshPage() {
    webviewController.reload();
  }

  void playAudio() {
    webviewController.runJavaScript("document.querySelector('audio')?.play();");
  }

  void exitApp() {
    WakelockPlus.disable();
    Get.close(0);
  }
}
