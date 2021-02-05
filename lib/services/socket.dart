import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:app_music/enums/serverstatus.dart';

class SocketService with ChangeNotifier {
  String _uri = 'http://localhost:3000';
  ServerStatusEnum _serverStatus = ServerStatusEnum.Connecting;
  Socket _socket;

  ServerStatusEnum get serverStatus => this._serverStatus;
  Socket get socket => this._socket;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    try {
      this._socket = io(
          _uri,
          OptionBuilder()
              .setTransports(['websocket']) // for Flutter or Dart VM
              .enableAutoConnect()
              .build());

      this._socket.onConnect((_) {
        this._serverStatus = ServerStatusEnum.Online;
        notifyListeners();
        print('connect');
      });

      this._socket.on('connect_error', (data) {
        this._serverStatus = ServerStatusEnum.Offline;
        notifyListeners();
        print(data);
      });

      this._socket.onDisconnect((_) {
        this._serverStatus = ServerStatusEnum.Offline;
        notifyListeners();
        print('disconnect');
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
