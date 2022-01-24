import 'package:flutter/material.dart';

class user_change_dialog extends StatelessWidget {
  user_change_dialog({Key? key, required this.changeCordinate})
      : super(key: key);
  final String changeCordinate;
  final _formkey = GlobalKey<FormState>();
  final List<String> _labelData = [];
  final Map<String, String> _formData = {};
  void _submitForm(BuildContext ctx) {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      print(_formData);
      Navigator.pop(ctx, _formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (changeCordinate == "User") {
      _labelData.addAll(["Cá nhân", "Họ,", "Tên", "Số điện thoại"]);
    } else {
      _labelData
          .addAll(["Doanh Nghiệp", "Tên doanh nghiệp", "Mã số thuế", "Email"]);
    }

    return Dialog(
      elevation: 0,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bạn có chắc muốn chuyển sang tư cách ${_labelData[0]}?",
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_labelData[1]),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        fillColor: Colors.grey,
                        filled: true),
                    onSaved: (newValue) => _formData["1"] = newValue.toString(),
                    validator: (value) {
                      if (changeCordinate == "User") {
                        if (value == "" || value!.length > 20)
                          return "Nhập từ 1 đến 20 ký tự ";
                      } else {
                        if (value == "" || value!.length > 100)
                          return "Nhập từ 1 đến 100 ký tự ";
                        if (RegExp(r'^[!@#$%^&*]+$').hasMatch(value))
                          return "Sai định dạng";
                      }
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_labelData[2]),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        fillColor: Colors.grey,
                        filled: true),
                    onSaved: (newValue) => _formData["2"] = newValue.toString(),
                    validator: (value) {
                      if (changeCordinate == "User") {
                        if (value == "" || value!.length > 20)
                          return "Nhập từ 1 đến 20 ký tự ";
                      } else {
                        if (value == "" || value!.length > 100)
                          return "Nhập từ 1 đến 100 ký tự ";
                        if (!RegExp(r'^[0-9]+$').hasMatch(value))
                          return "Sai định dạng";
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_labelData[3]),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                        fillColor: Colors.grey,
                        filled: true),
                    onSaved: (newValue) => _formData["3"] = newValue.toString(),
                    validator: (value) {
                      if (changeCordinate == "User") {
                        if (value == "" || value!.length > 20)
                          return "Nhập từ 1 đến 20 ký tự ";
                        if (!RegExp(r'^[0-9]+$').hasMatch(value))
                          return "Nhập đúng định dạng";
                      } else {
                        if (value == "" || value!.length > 100)
                          return "Nhập từ 1 đến 100 ký tự ";
                        if (RegExp(r'^[@]+$').hasMatch(value))
                          return "Sai định dạng";
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => _submitForm(context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              child: const Text(
                "XÁC NHẬN",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
