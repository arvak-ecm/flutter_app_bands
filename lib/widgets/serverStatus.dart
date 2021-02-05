import 'package:flutter/material.dart';
import 'package:app_music/enums/serverstatus.dart';

class ServerStatusWidget extends StatelessWidget {
  final ServerStatusEnum status;
  static IconData _icon;
  static Color _color;

  const ServerStatusWidget({
    Key key,
    this.status
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == ServerStatusEnum.Online) {
      _icon = Icons.check_circle;
      _color = Colors.blue[500];
    }else{
      _icon = Icons.offline_bolt;
      _color = Colors.redAccent;
    }
    return Icon(_icon, color: _color);
  }
}
