// import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
// import 'package:and_beyond/Utils%20and%20Services/storage_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class ConnectionController extends GetxController {
//   final ipController = TextEditingController();
//   final portController = TextEditingController();
//   final recentConnections = <Map<String, String>>[].obs;
//   var selectedConnection = ''.obs;

//   void connectManually() {
//     String ip = ipController.text.trim();
//     String port = portController.text.trim();

//     if (ip.isEmpty || port.isEmpty) {
//       Get.snackbar("Error", "Please enter IP and Port properly.");
//       return;
//     }

//     String url = ip.startsWith('http') ? ip : 'http://$ip:$port';
//     StorageService().addConnection(ip, port);
//     Get.toNamed(AppRoutes.webview, arguments: url);
//   }

//   void loadConnections() {
//     recentConnections.value = StorageService().getConnections();
//   }

//   void selectConnection(String ipPort) {
//     if (!ipPort.startsWith('http')) {
//       ipPort = 'http://$ipPort';
//     }
//     selectedConnection.value = ipPort;
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:and_beyond/Utils%20and%20Services/storage_service.dart';
import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';

class ConnectionController extends GetxController {
  final ipController = TextEditingController();
  final portController = TextEditingController();
  final recentConnections = <Map<String, dynamic>>[].obs;
  var selectedConnection = ''.obs;
  var selectedIndex = (-1).obs; // ✅ TRACK which tile selected

  void connectManually() {
    String ip = ipController.text.trim();
    String port = portController.text.trim();

    if (ip.isEmpty || port.isEmpty) {
      Get.snackbar("Error", "Please enter IP and Port properly.");
      return;
    }

    String url = ip.startsWith('http') ? ip : 'http://$ip:$port';
    StorageService().addConnection(ip, port);
    Get.toNamed(AppRoutes.webview, arguments: url);
  }

  void loadConnections() {
    List<dynamic> storedList = StorageService().getConnections();
    recentConnections.value = storedList.map<Map<String, dynamic>>((item) => Map<String, dynamic>.from(item)).toList();
  }

  void selectConnection(int index, String ipPort) {
    selectedIndex.value = index;
    selectedConnection.value = ipPort;
  }
}
