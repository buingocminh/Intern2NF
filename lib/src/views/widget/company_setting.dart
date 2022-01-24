import 'package:flutter/material.dart';
import 'package:job/src/views/widget/confirm_dialog.dart';

class company_setting extends StatefulWidget {
  company_setting({Key? key}) : super(key: key);

  @override
  State<company_setting> createState() => _company_settingState();
}

class _company_settingState extends State<company_setting> {
  final _formkey = GlobalKey<FormState>();

  void _formSubmit() {
    if (_formkey.currentState!.validate()) {
      //lưu data
      showDialog(
          context: context,
          barrierColor: Color.fromRGBO(255, 255, 255, 0.7),
          builder: (_) =>
              confirm_dialog(message: "Thông tin của bạn đã được cập nhật"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Tên doanh nghiệp "),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (value.toString().length > 100)
                        return "Hãy nhập dưới 100 ký tự";
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Mã số thuế"),
                  validator: (value) {
                    if (value != "") {
                      if (value.toString().length > 20)
                        return "Hãy nhập dưới 20 ký tự";
                      if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                        return "Sai định dạng";
                      }
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Địa chỉ"),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Số điện thoại"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (value.toString().length > 20)
                        return "Hãy nhập dưới 20 ký tự";
                      if (!RegExp(r'^[0-9]+$').hasMatch(value.toString())) {
                        return "Sai định dạng";
                      }
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (value.toString().length > 100)
                        return "Hãy nhập dưới 100 ký tự";
                      if (!RegExp(r'@').hasMatch(value.toString())) {
                        return "Sai định dạng";
                      }
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Website"),
                  validator: (value) {
                    if (value != "") {
                      //kiểm tra data đã lưu
                      //
                      if (value.toString().length > 100)
                        return "Hãy nhập dưới 200 ký tự";
                      if (!value.toString().contains(".")) {
                        return "Sai định dạng";
                      }
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text("THÊM LOGO CÔNG TY",
                        style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: "Giới thiệu về công ty",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.toString().length > 5000)
                      return "Hãy nhập dưới 5000 ký tự";
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _formSubmit,
                      child: Text(
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
}
