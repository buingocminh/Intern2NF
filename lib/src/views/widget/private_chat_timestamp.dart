import 'package:flutter/material.dart';

class chat_time_stamp extends StatelessWidget {
  const chat_time_stamp({Key? key, required this.chattime}) : super(key: key);
  final DateTime chattime;
  String _TimeToString() {
    String s = chattime.toString();
    switch (DateTime.now().difference(chattime).inDays) {
      case 0:
        s = "${chattime.hour} : ${chattime.minute}";
        break;
      case 1:
        s = "hôm qua ${chattime.hour} : ${chattime.minute}";
        break;
      // case 2:
      //   s = "hôm kia";
      //   break;
      default:
        s = "${chattime.year}-${chattime.month}-${chattime.day} ${chattime.hour}: ${chattime.minute}";
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(_TimeToString())],
      ),
    );
  }
}
