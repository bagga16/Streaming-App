

import 'package:and_beyond/Controllers/connection_controller.dart';
import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
import 'package:and_beyond/custom_button.dart';
import 'package:and_beyond/custom_text_field.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';
class JoinScreen extends StatelessWidget {

  final ConnectionController controller = Get.put(ConnectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 236, 236),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.music_note, size: 68, color: Color(0xFF2563EB)),
              const SizedBox(height: 16),
              const Text(
                'Join My Audio Stream',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF1E3A8A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter the IP address and port or scan a\nQR code to join an audio stream',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
               CustomTextField(
              controller: controller.ipController,
              labelText: "IP Address",
              icon: Icons.dns_outlined,
              keyboardType: TextInputType.number,
            ),
              const SizedBox(height: 12),
               CustomTextField(
              controller: controller.portController,
              labelText: "Port",
              icon: Icons.tag,
              keyboardType: TextInputType.number,
            ),
              const SizedBox(height: 30),
                CustomButton(
                  text: 'Connect',
                  icon: Icons.play_arrow, 
                  onPressed: 
                    controller.connectManually,

                   
                  
                
              ),
              
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 30),
               CustomButton(
                text: 'Scan QR Code',
                icon: Icons.qr_code_scanner,
                outline: true, onPressed: () { 
                Get.toNamed(AppRoutes.qrScanner);
                 },
              ),
              const SizedBox(height: 12),
              CustomButton(
                onPressed: (){
               Get.toNamed(AppRoutes.recentConnections);
              
                },
                text: 'Join from recents',
                outline: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:and_beyond/Controllers/connection_controller.dart';
// import 'package:and_beyond/Utils%20and%20Services/app_routes.dart';
// import 'package:and_beyond/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class JoinScreen extends StatelessWidget {
//   final ConnectionController controller = Get.put(ConnectionController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//          backgroundColor: const Color.fromARGB(255, 238, 236, 236),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             CustomTextField(
//               controller: controller.ipController,
//               labelText: "IP Address",
//               icon: Icons.computer,
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             CustomTextField(
//               controller: controller.portController,
//               labelText: "Port",
//               icon: Icons.confirmation_number,
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 30),
            
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 minimumSize: Size(double.infinity, 50),
//               ),
//               onPressed: controller.connectManually,
//               icon: Icon(Icons.play_arrow),
//               label: Text("Connect"),
//             ),
//             SizedBox(height: 20),
//             Text("OR", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//             SizedBox(height: 20),
//             OutlinedButton.icon(
//               style: OutlinedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//                 side: BorderSide(color: Colors.blue),
//               ),
//               onPressed: () => Get.toNamed(AppRoutes.qrScanner),
//               icon: Icon(Icons.qr_code, color: Colors.blue),
//               label: Text("Scan QR Code", style: TextStyle(color: Colors.blue)),
//             ),
//             SizedBox(height: 30),
            // TextButton(
            //   onPressed: () => Get.toNamed(AppRoutes.recentConnections),
            //   child: Text(
            //     "Join from recents",
            //     style: TextStyle(
            //       decoration: TextDecoration.underline,
            //       color: Colors.blue,
            //       fontSize: 16,
            //     ),
            //   ),
            // )
//           ],
//         ),
//       ),
//     );
//   }
// }
