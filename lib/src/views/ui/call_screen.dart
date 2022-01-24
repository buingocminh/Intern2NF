import 'dart:ui';

import 'package:flutter/material.dart';

class call_screen extends StatelessWidget {
  const call_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "thời gian gọi",
                style: TextStyle(color: Colors.red, fontSize: 13),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://placeimg.com/640/480/any",
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: ImageIcon(
                    AssetImage("assets/icon/phone-hang-up.png"),
                    size: 90,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
