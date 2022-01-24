import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job/src/logic/controller/user_controller.dart';
import 'package:job/src/logic/models/app_user.dart';

// ignore: camel_case_types
class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

// ignore: camel_case_types
class _login_pageState extends State<login_page> {
  final _formKey = GlobalKey<FormState>();
  final UserController _userController = Get.put(UserController());
  // final AppUser appUser = AppUser();
  final Map<String, dynamic> _data = {
    "Username": null,
    "Password": null,
  };
  bool _islogin = false;
  String? _error;
  void _showError(String error) async {
    setState(() {
      _error = error;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _error = null;
    });
  }

  void _anonymousSignin() async {
    print(FirebaseAuth.instance.currentUser!.uid);
    print(FirebaseAuth.instance.currentUser!.email);
    _userController.Logout();
  }

  void _forgotPassword() async {
    Navigator.pushNamed(context, '/src/view/ui/forgot_password_screen');
    //await FirebaseAuth.instance.signOut();
  }

  void _Login(BuildContext ctx) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_data);
      await _userController.LogIn(data: _data).then(
          (value) => Navigator.pushNamed(context, "/src/views/ui/Master"),
          onError: (e) => _showError(e.toString()));
    }
  }

  void _facebookLogin() async {
    await FirebaseAuth.instance.signOut();
    await _userController.FacebookLogin().then(
        (value) => Navigator.pushNamed(context, "/src/views/ui/Master"),
        onError: (errol) => _showError(errol.toString()));

    //print(res.status);
  }

  Future<void> _googleLogin() async {
    await FirebaseAuth.instance.signOut();
    await _userController.GoogleLogin().then(
        (value) => Navigator.pushNamed(context, "/src/views/ui/Master"),
        onError: (errol) => _showError(errol.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints.expand(),
      //height: double.minPositive,
      //color: Colors.amber,
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: _anonymousSignin,
            child: Container(
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: const Text(
                "ĐĂNG NHẬP VỚI TƯ CÁCH LÀ KHÁCH",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Row(
            children: const [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  height: 30,
                ),
              ),
              Text("Hoặc"),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  height: 30,
                ),
              ),
            ],
          ),

          if (_error != null)
            Container(
              color: Colors.white70,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                _error!,
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _showError("Hãy điền tài khoản");
                    } else if (value.length < 6 || value.length > 20)
                      _showError("nhập từ 6 đến 20 ký tự");
                  },
                  onSaved: (newValue) =>
                      _data["Username"] = newValue, // appUser.Email = newValue,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Tài Khoản",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _showError("Hãy điền mật khẩu");
                      return;
                    } else if (value.length < 6 || value.length > 20) {
                      _showError("nhập từ 6 đến 20 ký tự");
                      return;
                    }
                  },
                  onSaved: (val) {
                    // appUser.Password = val;
                    _data["Password"] = val;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Mật Khẩu",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => _Login(context),
                      child: Text(
                        "Đăng Nhập",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: _forgotPassword,
                      child: Text(
                        "Quên mật khẩu",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          //Text("-------------------Hoặc---------------"),
          Row(
            children: const [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  height: 30,
                ),
              ),
              Text("Hoặc"),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  height: 30,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: _facebookLogin,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: Colors.blue,
                  child: Row(
                    children: const [
                      ImageIcon(
                        AssetImage("assets/icon/facebook.png"),
                        color: Colors.white,
                      ),
                      Text(
                        "accebook",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: _googleLogin,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: Colors.red,
                  child: Row(
                    children: const [
                      ImageIcon(
                        AssetImage("assets/icon/google.png"),
                        color: Colors.white,
                      ),
                      Text(
                        " oogle",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
