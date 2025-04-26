import 'package:get_storage/get_storage.dart';

class StorageService {
  final box = GetStorage();

  void addConnection(String ip, String port) {
    List<dynamic> connections = box.read('connections') ?? [];
    connections.insert(0, {"ip": ip, "port": port});

    // Keep only latest 5
    if (connections.length > 5) {
      connections = connections.sublist(0, 5);
    }

    box.write('connections', connections);
  }

  List<Map<String, String>> getConnections() {
    List<dynamic> connections = box.read('connections') ?? [];
    return connections.cast<Map<String, String>>();
  }
}

