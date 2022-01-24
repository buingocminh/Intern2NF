import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:job/src/views/widget/custom_home_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CollectionReference _API = FirebaseFirestore.instance.collection("API");

  @override
  Widget build(BuildContext context) {
    //_getData();
    // print(list);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "TEA WORK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'DancingScript',
                    fontWeight: FontWeight.bold,
                    //fontS,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            FutureBuilder<DocumentSnapshot>(
                future: _API.doc("MasterText").get(),
                builder: (BuildContext ctx,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> _textData =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return custom_home_slider(textData: _textData);
                  }
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
