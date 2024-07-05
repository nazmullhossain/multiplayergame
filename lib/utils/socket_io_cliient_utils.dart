import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIoCliientUtils {
  IO.Socket? socket;
  static SocketIoCliientUtils? _instance;

  SocketIoCliientUtils._internal() {
    socket = IO.io('http://192.168.1.101:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }
  static  SocketIoCliientUtils get instance{
    _instance ??=SocketIoCliientUtils._internal();
    return _instance!;
  }
}
