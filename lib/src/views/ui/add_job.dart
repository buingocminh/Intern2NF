import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job/src/views/widget/confirm_dialog.dart';
import 'package:job/src/views/widget/custom_header.dart';
import 'package:job/src/views/widget/error_dialog.dart';

class add_job extends StatefulWidget {
  const add_job({Key? key}) : super(key: key);

  @override
  State<add_job> createState() => _add_jobState();
}

class _add_jobState extends State<add_job> {
  final GlobalKey _scaffoldkey = GlobalKey();
  final _dropdownval = ["VND", "USD"];
  final _formkey = GlobalKey<FormState>();
  // biến lưu data form
  final Map<String, dynamic> _data = {
    "SalaryTyple": "VND",
    "JobTyple": "fulltime",
  };
  void _SubmitForm() async {
    if (!_formkey.currentState!.validate()) {
      showDialog(
          barrierColor: Color.fromRGBO(255, 255, 255, 0.7),
          context: context,
          builder: (_) => const error_dialog(
              message: "Lỗi \n Bài đăng chưa được gửi. \nHãy thử lại"));
    } else {
      // hiện dialog
      await showDialog(
              barrierColor: Color.fromRGBO(255, 255, 255, 0.7),
              context: context,
              builder: (_) =>
                  const confirm_dialog(message: "Bài đăng của bạn đã được gửi"))
          .then((value) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
        child: Column(
          children: [
            custom_header(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: "TIÊU ĐỀ BÀI VIẾT",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Mức lương từ*",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == "" ||
                                value!.length > 50 ||
                                !RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return "";
                            }
                            //chưa check ddingj dạng số
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Mức lương đến*",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          validator: (value) {
                            if (value!.length > 50 ||
                                !RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return "";
                            }
                          },
                        ),
                        DropdownButton(
                          isExpanded: true,
                          items: _dropdownval
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) => setState(() {
                            _data["SalaryTyple"] = val.toString();
                          }),
                          value: _data["SalaryTyple"],
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Thời gian*",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == "" ||
                                value!.length > 50 ||
                                !_DateTimeValidate(value)) {
                              return "";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Ngày bắt đầu đi làm*",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == "" ||
                                value!.length > 50 ||
                                !_DateTimeValidate(value)) {
                              return "";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Yêu cầu kinh nghiệm*",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == "" ||
                                value!.length > 50 ||
                                RegExp(r'^[!@#$%^&*]+$').hasMatch(value)) {
                              return "";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Nơi làm việc",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == "" || value!.length > 50) {
                              return "";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Trợ cấp*",
                            hintStyle: TextStyle(fontSize: 15),
                          ),
                          validator: (value) {
                            if (value == "" ||
                                value!.length > 50 ||
                                RegExp(r'^[!@#$%^&*]+$').hasMatch(value)) {
                              return "";
                            }
                          },
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: "fulltime",
                                    groupValue: _data["JobTyple"],
                                    onChanged: (val) => setState(() {
                                      _data["JobTyple"] = val.toString();
                                    }),
                                    //title:
                                  ),
                                  const Text("Toàn thời gian"),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: "parttime",
                                    groupValue: _data["JobTyple"],
                                    onChanged: (val) => setState(() {
                                      _data["JobTyple"] = val.toString();
                                    }),
                                  ),
                                  const Text("Bán thời gian"),
                                ],
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          maxLines: 5,
                          decoration: const InputDecoration(
                              hintText: "Thông tin khác",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black))),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)),
                          child: Column(
                            children: [
                              Text("Thêm thông tin nếu là công ty"),
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: "Tên công ty"),
                                validator: (value) {
                                  if (value != "" &&
                                      RegExp(r'^[!@#$%^&*]+$')
                                          .hasMatch(value.toString())) {
                                    return "";
                                  }
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: TextFormField(
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                      hintText: "Giới thiệu về công ty",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide())),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ElevatedButton(
                                    onPressed: null,
                                    child: Text(
                                      "ĐĂNG ẢNH CÔNG TY",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.black),
                                    ),
                                  ),
                                  //xử lý ảnh đăng lên ở đây
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 50),
                          child: ElevatedButton(
                            onPressed: () => _SubmitForm(),
                            child: Text(
                              "ĐĂNG",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _DateTimeValidate(String? value) {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    try {
      dateFormat.parse(value.toString());
      return true;
    } catch (e) {
      return false;
    }
  }
}
