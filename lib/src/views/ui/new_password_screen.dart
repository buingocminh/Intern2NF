import 'package:flutter/material.dart';
import 'package:job/src/views/widget/confirm_dialog.dart';

class new_password_screen extends StatelessWidget {
  new_password_screen({Key? key}) : super(key: key);
  final Map<String, String> _data = {};
  final _formkey = GlobalKey<FormState>();
  void _formSubmit(BuildContext ctx) {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      // sử lý data nhận vào tại đây
      showDialog(
          barrierColor: Colors.white,
          context: ctx,
          builder: (_) => confirm_dialog(message: "Đổi mật khẩu thành công"));
      // chưa xử lý navigate vội
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.chevron_left,
                      size: 30,
                    ))
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: "Mật khẩu mới*"),
                        validator: (value) {
                          if (value == "") return "Hãy nhập mật khẩu";
                        },
                        onSaved: (newValue) {
                          _data["Newpassword"] = newValue.toString();
                        },
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: "Nhập lại mật khẩu*"),
                        validator: (value) {
                          if (value == "") return "Hãy nhập mật khẩu";
                        },
                        onSaved: (newValue) {
                          _data["Repassword"] = newValue.toString();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: ElevatedButton(
                          onPressed: () => _formSubmit(context),
                          child: Text("GỬI"),
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
            )
          ],
        ),
      ),
    );
  }
}
