import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_music/services/socket.dart';

class StatusPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          'Music App',
          style: TextStyle(color: Colors.black45),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(socketService.serverStatus.toString())
          ],
        ),
      ),
    );
  }
}
