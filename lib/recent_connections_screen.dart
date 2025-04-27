// import 'package:and_beyond/Controllers/connection_controller.dart';
// import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
// import 'package:and_beyond/Utils%20and%20Services/storage_service.dart';
// import 'package:and_beyond/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RecentConnectionsScreen extends StatelessWidget {
//   final ConnectionController controller = Get.put(ConnectionController());
//   final StorageService storageService = StorageService();

//   @override
//   Widget build(BuildContext context) {
//     controller.loadConnections();

//     return Scaffold(
     
//       body: Obx(
//         () => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
//           child: Column(
//             children: [
//               SizedBox(height: 40,),
//               Text(
//           "Recent Connections",
//           style: TextStyle(color: const Color.fromRGBO(32, 114, 182, 1), fontWeight: FontWeight.bold, fontSize: 30),
//         ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: controller.recentConnections.length,
//                   itemBuilder: (context, index) {
//                     final connection = controller.recentConnections[index];
//                     final ipPort = "${connection['ip']}:${connection['port']}";
//                     return ListTile(
//                       title: Text(ipPort),
//                       trailing: Icon(Icons.arrow_forward_ios, size: 16),
//                       onTap: () {
//                         controller.selectConnection(ipPort);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 16),
//               CustomButton(text: "Join My Audio Stream", onPressed: (){
//                 if (controller.selectedConnection.isNotEmpty) {
//                     Get.toNamed(AppRoutes.webview, arguments: controller.selectedConnection);
//                   } else {
//                     Get.snackbar("No selection", "Please select a connection first.");
//                   }

//               }),
             
//               SizedBox(height: 20),
//               CustomButton(text:  "Go back to home",
           
//              outline: true,
//                 onPressed: () => Get.offAllNamed(AppRoutes.join),
//               ),
             
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:and_beyond/Controllers/connection_controller.dart';
import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
import 'package:and_beyond/custom_button.dart';

class RecentConnectionsScreen extends StatelessWidget {
  final ConnectionController controller = Get.put(ConnectionController());

  @override
  Widget build(BuildContext context) {
    controller.loadConnections();

    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Recent Connections",
                style: TextStyle(
                  color: Color.fromRGBO(32, 114, 182, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.recentConnections.length,
                  itemBuilder: (context, index) {
                    final connection = controller.recentConnections[index];
                    final ip = connection['ip'] ?? '';
                    final port = connection['port'] ?? '';
                    final ipPort = "$ip:$port";

                    final isSelected = controller.selectedIndex.value == index;

                    return GestureDetector(
                      onTap: () {
                        controller.selectConnection(index, ipPort);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? Color.fromRGBO(32, 114, 182, 1) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Color.fromRGBO(32, 114, 182, 1) : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ipPort,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle, color: Colors.white)
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Join My Audio Stream",
                onPressed: () {
                  if (controller.selectedConnection.value.isNotEmpty) {
                    final selectedIpPort = controller.selectedConnection.value;
                    final url = "http://$selectedIpPort"; // final URL to open
                    Get.toNamed(AppRoutes.webview, arguments: url);
                  } else {
                    Get.snackbar("No Selection", "Please select a connection first.");
                  }
                },
              ),
              SizedBox(height: 15),
              CustomButton(
                text: "Go back to home",
                outline: true,
                onPressed: () => Get.offAllNamed(AppRoutes.join),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
