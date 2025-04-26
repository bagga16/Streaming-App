import 'package:and_beyond/Controllers/connection_controller.dart';
import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
import 'package:and_beyond/Utils%20and%20Services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentConnectionsScreen extends StatelessWidget {
  final ConnectionController controller = Get.put(ConnectionController());
  final StorageService storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    controller.loadConnections();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Recent Connections",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.recentConnections.length,
                  itemBuilder: (context, index) {
                    final connection = controller.recentConnections[index];
                    final ipPort = "${connection['ip']}:${connection['port']}";
                    return ListTile(
                      title: Text(ipPort),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        controller.selectConnection(ipPort);
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  if (controller.selectedConnection.isNotEmpty) {
                    Get.toNamed(AppRoutes.webview, arguments: controller.selectedConnection);
                  } else {
                    Get.snackbar("No selection", "Please select a connection first.");
                  }
                },
                child: Text("Join My Audio Stream"),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Get.offAllNamed(AppRoutes.join),
                child: Text(
                  "Go back to home",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
