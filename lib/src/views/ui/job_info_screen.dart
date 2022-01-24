// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:job/src/logic/controller/job_controller.dart';
import 'package:job/src/logic/models/Job.dart';
import 'package:job/src/views/widget/custom_header.dart';

class job_info_screen extends StatefulWidget {
  const job_info_screen({Key? key}) : super(key: key);

  @override
  _job_info_screenState createState() => _job_info_screenState();
}

class _job_info_screenState extends State<job_info_screen> {
  late Job _job;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    _job = Get.find<JobController>().JobById(id);
    _job.Data();
    //print(_job.ID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            custom_header(
              checked: _job.IsChecked,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _job.Name,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        height: 65,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 30, 30, 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Mức lương:",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      intl.NumberFormat.decimalPattern()
                                          .format(_job.Price),
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Thời gian:",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      _job.Time.toString(),
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Ngày bắt đầu đi làm:",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      _job.StartTime.toString(),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Yêu cầu kinh nghiệm:",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      _job.Exprequire.toString(),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Nơi làm việc:",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      _job.WorkingPlace.toString(),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      flex: 2,
                                      child: Text(
                                        "Trợ cấp:",
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      _job.Subsidize.toString(),
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Divider(
                        height: 80,
                      ),
                      Text(
                        "ỨNG TUYỂN LUÔN",
                        style: TextStyle(fontSize: 30),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "lời nhắn cho nhà tuyển dụng"),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: null,
                            child: Text("Tải CV"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white)),
                          ),
                          ElevatedButton(
                            onPressed: null,
                            child: Text("Gửi"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Thông tin khác",
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Đoạn này là thông tin khác",
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Giới thiệu về công ty",
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://placeimg.com/640/480/any",
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text("Đoạn này là thông tin về công ty"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
