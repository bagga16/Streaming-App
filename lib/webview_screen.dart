// import 'package:and_beyond/Controllers/webview_controller.dart';
// import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatelessWidget {
//   final WebviewController controller = Get.put(WebviewController());

//   @override
//   Widget build(BuildContext context) {
//     controller.url = Get.arguments ?? '';
//     controller.initializeWebview();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Column(
//           children: [
//             Text(
//               "Join My Audio Stream",
//               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               "Audio Listener",
//               style: TextStyle(color: Colors.grey, fontSize: 14),
//             ),
//           ],
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(controller: controller.webviewController),
//           Obx(() => controller.isLoading.value
//               ? Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       CircularProgressIndicator(),
//                       SizedBox(height: 20),
//                       Text("Connecting to broadcast...", style: TextStyle(fontSize: 16)),
//                     ],
//                   ),
//                 )
//               : SizedBox.shrink()),
//           Positioned(
//             bottom: 30,
//             right: 30,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 FloatingActionButton(
//                   heroTag: 'refresh',
//                   backgroundColor: Colors.blue,
//                   onPressed: controller.refreshPage,
//                   child: Icon(Icons.refresh),
//                   mini: true,
//                 ),
//                 SizedBox(height: 10),
//                 FloatingActionButton(
//                   heroTag: 'home',
//                   backgroundColor: Colors.blue,
//                   onPressed: () => Get.offAllNamed(AppRoutes.join),
//                   child: Icon(Icons.home),
//                   mini: true,
//                 ),
//                 SizedBox(height: 10),
//                 FloatingActionButton(
//                   heroTag: 'exit',
//                   backgroundColor: Colors.red,
//                   onPressed: controller.exitApp,
//                   child: Icon(Icons.close),
//                   mini: true,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: Colors.blue,
//         onPressed: controller.playAudio,
//         icon: Icon(Icons.play_arrow),
//         label: Text("Play Audio"),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Text(
//             "© 2025 Loud and Beyond - Audio Listener. All rights reserved.",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12, color: Colors.grey),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:and_beyond/Controllers/webview_controller.dart';
import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final WebviewController controller = Get.put(WebviewController());

  @override
  Widget build(BuildContext context) {
    controller.url = Get.arguments ?? '';
    controller.initializeWebview();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Top Blue Bar
              Container(
                width: double.infinity,
                height: 120,
                color: Color.fromRGBO(32, 114, 182, 1),
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      "Join My Audio Stream",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.refresh, color: Colors.white),
                      onPressed: controller.refreshPage,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    WebViewWidget(controller: controller.webviewController),
                    Obx(() => controller.isLoading.value
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/logo.png",
                                height: 120,
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Audio Listener",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(180, 205, 228, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Connecting to broadcast...",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(32, 114, 182, 1),
                                  minimumSize: Size(180, 50),
                                ),
                                onPressed: controller.playAudio,
                                icon: Icon(Icons.play_arrow),
                                label: Text("Play Audio"),
                              ),
                            ],
                          )
                        : SizedBox.shrink()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "© 2025 Loud ad Beyond - Audio Listener.\nAll rights reserved.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              // Bottom Buttons (Home + Exit)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(32, 114, 182, 1),
                      heroTag: 'home',
                      onPressed: () => Get.offAllNamed(AppRoutes.join),
                      child: Icon(Icons.home),
                    ),
                    SizedBox(width: 20),
                    FloatingActionButton(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      heroTag: 'exit',
                      onPressed: controller.exitApp,
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
