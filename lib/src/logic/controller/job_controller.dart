import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/Job.dart';

class JobController extends GetxController {
  List _jobList = [].obs;
  List _jobTyple = [];
  List _provinceList = [];
  String? JobSection = null;
  List<Job> get JobList {
    return [..._jobList];
  }

  List<String> get JobTyple {
    return [..._jobTyple];
  }

  List<String> get ProvineList {
    return [..._provinceList];
  }

  Future getData() async {
    _jobList = [];
    _jobTyple = [];
    _provinceList = [];
    await FirebaseFirestore.instance
        .collection("Job")
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((element) {
        print(element.id);
        _jobList.add(Job(
            Name: element["Name"],
            Price: element["MaxSalary"],
            Location: element["WorkingPlace"],
            UserID: element["UserId"],
            Exprequire: element["ExpRequired"],
            MinSalary: element["MinSalary"],
            StartTime: element["StartTime"],
            TypeOfSalary: element["TypleSalary"],
            WorkingPlace: element["WorkingPlace"],
            Subsidize: element["Subsidize"].toString(),
            Time: element["Time"],
            ID: element.id,
            NumOfView: element["NumOfView"]));
      });
    });
    print("Job ok");
    await FirebaseFirestore.instance
        .collection("API")
        .doc("JobTyple")
        .get()
        .then((DocumentSnapshot snapshot) {
      Map<String, dynamic> _data = snapshot.data() as Map<String, dynamic>;
      _jobTyple = _data.values.toList();
    });
    await FirebaseFirestore.instance
        .collection("API")
        .doc("City")
        .get()
        .then((DocumentSnapshot snapshot) {
      Map<String, dynamic> _data = snapshot.data() as Map<String, dynamic>;
      _provinceList = _data.values.toList();
    });
    print("get Data complete");
  }

  Job JobById(String id) {
    return _jobList.firstWhereOrNull((element) => element.ID == id);
  }

  Future IncreaseView(String id) async {
    await FirebaseFirestore.instance
        .collection("Job")
        .doc(id)
        .update({"NumOfView": FieldValue.increment(1)});
  }

  List<Job> SearchByCriteria(Map<String, dynamic> criteria) {
    List<Job> list = [];
    // thực hiện sắp xếp và tìm kiếm theo điều kiện
    list = JobList;
    return list;
  }
}
