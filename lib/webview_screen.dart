import 'package:and_beyond/Controllers/webview_controller.dart';
import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final WebviewController controller = Get.put(WebviewController());

  @override
  Widget build(BuildContext context) {
    controller.url = Get.arguments ?? '';
    controller.initializeWebview();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Text(
              "Join My Audio Stream",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Audio Listener",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller.webviewController),
          Obx(() => controller.isLoading.value
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text("Connecting to broadcast...", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )
              : SizedBox.shrink()),
          Positioned(
            bottom: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'refresh',
                  backgroundColor: Colors.blue,
                  onPressed: controller.refreshPage,
                  child: Icon(Icons.refresh),
                  mini: true,
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'home',
                  backgroundColor: Colors.blue,
                  onPressed: () => Get.offAllNamed(AppRoutes.join),
                  child: Icon(Icons.home),
                  mini: true,
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'exit',
                  backgroundColor: Colors.red,
                  onPressed: controller.exitApp,
                  child: Icon(Icons.close),
                  mini: true,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: controller.playAudio,
        icon: Icon(Icons.play_arrow),
        label: Text("Play Audio"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            "© 2025 Loud and Beyond - Audio Listener. All rights reserved.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
