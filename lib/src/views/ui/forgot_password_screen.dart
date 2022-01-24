import 'package:flutter/material.dart';
import 'package:job/src/views/widget/confirm_dialog.dart';

class forgot_password_screen extends StatelessWidget {
  forgot_password_screen({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final Map<String, String> _data = {};
  void _formSubmit(BuildContext ctx) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      // xử lý đặt lại mật khẩu ở đây
      await showDialog(
              barrierColor: Colors.white,
              context: ctx,
              builder: (_) => confirm_dialog(
                  message:
                      "Yêu cầu cấp lại mật khẩu của bạn đã được xử lý.\nHãy vào hòm thư để lấy mật khẩu mới"))
          .then((value) => Navigator.popAndPushNamed(
              ctx, '/src/view/ui/new_pasword_screen'));
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
                        decoration: InputDecoration(hintText: "Tài khoản*"),
                        validator: (value) {
                          if (value == "") return "Hãy nhập tài khoản";
                        },
                        onSaved: (newValue) {
                          _data["Username"] = newValue.toString();
                        },
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Email*"),
                        validator: (value) {
                          if (value == "") return "Hãy nhập tài khoản";
                        },
                        onSaved: (newValue) {
                          _data["Email"] = newValue.toString();
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
