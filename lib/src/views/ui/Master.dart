import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/controller/job_controller.dart';
import 'package:job/src/views/widget/Job_list_item.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../logic/models/Job.dart';

class MasterPage extends StatefulWidget {
  MasterPage({Key? key}) : super(key: key);

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  late JobController _jobController;
  bool _jobPicked = false;
  var dropdowVal = "Chọn Ngành Nghề";
  List<String> _job = ["Chọn Ngành Nghề"];
  List<Job> _jobList = [];

  void _FindJob() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushNamed(context, '/src/view/ui/job_searching');
      _jobController.JobSection = dropdowVal;
    } else {
      Navigator.pushNamed(context, '/src/view/ui/login', arguments: true);
    }
  }

  void _Addjob() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushNamed(context, '/src/view/ui/add_job');
      _jobController.JobSection = dropdowVal;
    } else {
      Navigator.pushNamed(context, '/src/view/ui/login', arguments: true);
    }
  }

  void _Forum() async {
    if (FirebaseAuth.instance.currentUser != null) {
      Navigator.pushNamed(context, '/src/view/ui/forum_screen');
      _jobController.JobSection = dropdowVal;
    } else {
      Navigator.pushNamed(context, '/src/view/ui/login', arguments: true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _jobController = Get.find<JobController>();
    print("find job controller");
    //_jobController.JobList[0].Data();
    //print(_jobController);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _jobList = _jobController.JobList;
    _job.addAll(_jobController.JobTyple);
  }

  @override
  Widget build(BuildContext context) {
    //_jobController.dispose();
    //_jobController.JobList[0].Data();
    _jobList[0].Data();
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/src/view/ui/login",
                        arguments: true);
                  },
                  child: Text("ĐĂNG NHẬP"),
                ),
                Text("|"),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () => {
                    Navigator.pushNamed(context, "/src/view/ui/login",
                        arguments: false)
                  },
                  child: Text("ĐĂNG KÝ"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      child: DropdownButton(
                        isExpanded: true,
                        value: dropdowVal,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: _job
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (String? e) {
                          setState(() {
                            if (e != "Chọn Ngành Nghề") {
                              _jobPicked = true;
                            } else {
                              _jobPicked = false;
                            }
                            dropdowVal = e!;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Button("Tìm Việc Ngay", Icons.search, _FindJob),
                          Button(
                              "Đăng tin tuyển dụng", Icons.push_pin, _Addjob),
                          Button("Tham ra forum", Icons.link, _Forum),
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _jobList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return JobListItem(
                            job: _jobList[index],
                          );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Button(String name, IconData icon, VoidCallback function) {
    return TextButton(
      onPressed: () {
        (_jobPicked) ? function() : null;
      },
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        padding: EdgeInsets.all(5),
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 40,
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
