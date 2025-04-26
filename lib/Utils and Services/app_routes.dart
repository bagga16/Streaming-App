import 'package:and_beyond/Home_screen.dart';
import 'package:and_beyond/qr_scanner_screen.dart';
import 'package:and_beyond/recent_connections_screen.dart';
import 'package:and_beyond/splash_screen.dart';
import 'package:and_beyond/webview_screen.dart';
import 'package:get/get.dart';
class AppRoutes {
  static const splash = '/splash';
  static const join = '/join';
  static const qrScanner = '/qrScanner';
  static const webview = '/webview';
  static const recentConnections = '/recentConnections';

  static final routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: join, page: () => JoinScreen()),
    GetPage(name: qrScanner, page: () => QRScannerScreen()),
    GetPage(name: webview, page: () => WebViewScreen()),
    GetPage(name: recentConnections, page: () => RecentConnectionsScreen()),
  ];
}
