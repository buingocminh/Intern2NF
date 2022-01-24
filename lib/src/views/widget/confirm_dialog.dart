import 'package:flutter/material.dart';

class confirm_dialog extends StatelessWidget {
  const confirm_dialog({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
      child: Container(
        height: 300,
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.check,
                color: Colors.green,
                size: 70,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
