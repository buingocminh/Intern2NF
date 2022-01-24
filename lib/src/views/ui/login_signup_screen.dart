import 'package:flutter/material.dart';
import 'package:job/src/views/widget/login_page.dart';
import 'package:job/src/views/widget/signin_page.dart';

class Login_Signup extends StatefulWidget {
  const Login_Signup({Key? key}) : super(key: key);

  @override
  _Login_SignupState createState() => _Login_SignupState();
}

class _Login_SignupState extends State<Login_Signup> {
  late bool _isLogin;
  @override
  void didChangeDependencies() {
    _isLogin = ModalRoute.of(context)?.settings.arguments as bool;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _isLogin = true;
                      }),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 1),
                            bottom: (!_isLogin)
                                ? BorderSide(color: Colors.black, width: 1)
                                : BorderSide.none,
                          ),
                        ),
                        child: Text(
                          "Đăng Nhập",
                          style: TextStyle(
                            color: (_isLogin) ? Colors.red : Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _isLogin = false;
                      }),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 1),
                            bottom: (_isLogin)
                                ? BorderSide(color: Colors.black, width: 1)
                                : BorderSide.none,
                          ),
                        ),
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            color: (!_isLogin) ? Colors.red : Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              (_isLogin) ? login_page() : SignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
