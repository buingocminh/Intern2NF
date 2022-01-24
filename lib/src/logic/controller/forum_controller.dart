// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/models/thread.dart';

class ForumController extends GetxController {
  List listThread = [];
  //get ListThread => [...listThread];
  ///////
  // chưa search đc đl, sẽ chuyển sang hàm getdata sau dó search với biến sort by
  ///////
  Future<List> GetData(Map sortby) async {
    listThread = [];

    switch (sortby["Name"]) {
      case null:
        print("name null");
        if (sortby["SortBy"] == "Xem nhiều nhất") {
          return await FirebaseFirestore.instance
              .collection("Forum")
              .orderBy("NumOfChat")
              .get()
              .then((QuerySnapshot snapshot) {
            snapshot.docs.forEach((element) {
              Timestamp t = element["LastMessage"];
              print(t.toDate().toString());
              listThread.add(Thread(
                  ID: element.id,
                  Name: element["Name"],
                  Location: element["Location"],
                  NumOfComment: element["NumOfChat"]));
            });
            return listThread;
          });
        } else {
          return await FirebaseFirestore.instance
              .collection("Forum")
              .orderBy("LastMessage")
              .get()
              .then((QuerySnapshot snapshot) {
            snapshot.docs.forEach((element) {
              Timestamp t = element["LastMessage"];
              print(t.toDate().toString());
              listThread.add(Thread(
                  ID: element.id,
                  Name: element["Name"],
                  Location: element["Location"],
                  NumOfComment: element["NumOfChat"]));
            });
            return listThread;
          });
        }
      default:
        print("default");
        if (sortby["SortBy"] == "Xem nhiều nhất") {
          return await FirebaseFirestore.instance
              .collection("Forum")
              .where("Name", arrayContainsAny: [
                sortby["Name"],
                sortby["Name"].toString().toUpperCase(),
                sortby["Name"].toString().toLowerCase()
              ])
              .orderBy("NumOfChat")
              .get()
              .then((QuerySnapshot snapshot) {
                snapshot.docs.forEach((element) {
                  Timestamp t = element["LastMessage"];
                  print(t.toDate().toString());
                  listThread.add(Thread(
                      ID: element.id,
                      Name: element["Name"],
                      Location: element["Location"],
                      NumOfComment: element["NumOfChat"]));
                });
                return listThread;
              });
        } else {
          print("MỚi nhất");
          return await FirebaseFirestore.instance
              .collection("Forum")
              .where("Name", isGreaterThanOrEqualTo: sortby["Name"])
              .where("Name", isLessThan: sortby["Name"] + "Z")
              .orderBy("LastMessage")
              .get()
              .then((QuerySnapshot snapshot) {
            snapshot.docs.forEach((element) {
              Timestamp t = element["LastMessage"];
              print(t.toDate().toString());
              listThread.add(Thread(
                  ID: element.id,
                  Name: element["Name"],
                  Location: element["Location"],
                  NumOfComment: element["NumOfChat"]));
            });
            return listThread;
          });
        }
    }
    //print(listThread.length);
  }

  dynamic getForumbyID(String id) {
    return listThread
        .elementAt(listThread.indexWhere((element) => element.ID == id));
  }
}
