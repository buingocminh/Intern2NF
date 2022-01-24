import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job/src/views/widget/confirm_dialog.dart';

class user_setting extends StatefulWidget {
  user_setting({Key? key}) : super(key: key);

  @override
  State<user_setting> createState() => _user_settingState();
}

class _user_settingState extends State<user_setting> {
  final _formkey = GlobalKey<FormState>();

  // _job lấy từ api, ở đây đang để mặc định
  String? _jobdropdown = null;
  String? _genderdropdown = null;
  final _job = ["Lập trình viên", "Bất động sản", "Ngành khác"];
  final _gender = ["Nam", "Nữ", "Khác"];
  void _formSubmit() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      // cập nhật data
      await showDialog(
          barrierColor: Color.fromRGBO(255, 255, 255, 0.7),
          context: context,
          builder: (_) {
            return confirm_dialog(
                message: "Thông tin của bạn đã được cập nhật");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Họ"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (value.toString().length > 20) {
                        return "Hãy nhập dưới 20 ký tự";
                      }
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Tên"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (value.toString().length > 20) {
                        return "Hãy nhập dưới 20 ký tự";
                      }
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Ngày sinh"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (!_DateTimeValidate(value)) return "Sai định dạng";
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Địa chỉ"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (value.toString().length > 200) {
                        return "Hãy nhập dưới 200 ký tự";
                      }
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Số điện thoại"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                        return "Sai định dạng";
                      }
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (!RegExp(r'@').hasMatch(value.toString())) {
                        return "Sai định dạng";
                      }
                    }
                  },
                ),
                DropdownButton(
                  hint: const Text("Chọn chuyên môn"),
                  isExpanded: true,
                  value: _jobdropdown,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _job.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? e) {
                    setState(() {
                      _jobdropdown = e!;
                    });
                  },
                ),
                DropdownButton(
                  hint: const Text("Giới tính"),
                  isExpanded: true,
                  value: _genderdropdown,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _gender.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? e) {
                    setState(() {
                      _genderdropdown = e!;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: "Giới thiệu về Bản thân",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      if (value.toString().length > 1000) {
                        return "Nhập dưới 1000 ký tự";
                      }
                    },
                  ),
                ),

                // chưa set hàm chọn file
                ElevatedButton(
                  onPressed: null,
                  child: const Text(
                    "Thêm thẻ căn cước",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: const Text(
                    "Thêm CV",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: const Text(
                    "Thêm ảnh đại diện",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _formSubmit,
                      child: const Text(
                        "Cập Nhật",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
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
