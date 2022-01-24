// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/models/app_user.dart';
import 'package:job/src/logic/models/app_user.dart';

import '../../../src/logic/controller/user_controller.dart';
import '../../logic/models/app_user.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isloading = false;
  final _primariformKey = GlobalKey<FormState>();
  final _subformkey = GlobalKey<FormState>();
  String? _error;
  String _role = "company";
  var _appUser;
  Map<String, dynamic> _data = {
    "Username": null,
    "Password": null,
    "Email": null,
    "Phone": null,
    "Repassword": null,
    "Firstname": null,
    "Lastname": null,
    "Birthday": null,
    "Companyname": null,
    "Companylocation": null
  };

  void _showError(String error) async {
    setState(() {
      _error = error;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _error = null;
    });
  }

  void _register() async {
    if (_primariformKey.currentState!.validate()) {
      _primariformKey.currentState!.save();
      if (_data["Password"] != _data["Repassword"]) {
        _showError("Hãy nhập đúng Password");
        return;
      }
      // _subformkey.currentState!.save();
      // print(_data);
      setState(() {
        _isloading = true;
      });
      if (_data["Companyname"] == null) {
        _appUser = NormalUsser(
            UserName: _data["Username"],
            Password: _data["Password"],
            Email: _data["Email"],
            Phone: _data["Phone"],
            BirthDay: _data["BirthDay"],
            FirstName: _data["Firstname"],
            LastName: _data["Lastname"]);
      } else {
        _appUser = CompanyUser(
            UserName: _data["Username"],
            Password: _data["Password"],
            Email: _data["Email"],
            Phone: _data["Phone"],
            CompanyLocation: _data["Companylocation"],
            CompanyName: _data["Companyname"]);
      }
      print(_data);
      await _appUser.SignUp().then((value) async {
        Navigator.pushNamed(context, "/src/views/ui/Master");
      }, onError: (erol) {
        _showError(erol.toString());
        setState(() {
          _isloading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //   (_role == "company") ? _appUser = CompanyUser() : _appUser = NormalUsser();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 35),
      child: (_isloading)
          ? const CircularProgressIndicator()
          : Column(
              children: [
                if (_error != null)
                  Container(
                    color: Colors.white70,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      _error!,
                      style: const TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                Form(
                  key: _primariformKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _showError("Hãy điền tài khoản");
                            return "";
                          } else if (value.length < 6 || value.length > 20) {
                            _showError("nhập từ 6 đến 20 ký tự");
                            return "";
                          }
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Tài Khoản",
                        ),
                        onSaved: (newValue) => _data["Username"] = newValue,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _showError("Hãy điền mật khẩu");
                          } else if (value.length < 6 || value.length > 20) {
                            _showError("nhập từ 6 đến 20 ký tự");
                            return "";
                          }
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Mật Khẩu",
                        ),
                        onSaved: (newValue) =>
                            _data["Password"] = newValue.toString(),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _showError("Hãy điền mật khẩu");
                            return "";
                          }
                          // _primariformKey.currentState!.save();
                          // if (value != _data["Password"]) {
                          //   _showError("Hãy nhập giống Password");
                          //   return "";
                          // }
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Xác nhận mật khẩu",
                        ),
                        onSaved: (newValue) => _data["Repassword"] = newValue,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _showError("Hãy điền email");
                            return "";
                          }
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Email",
                        ),
                        onSaved: (newvalue) => _data["Email"] = newvalue,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            _showError("Hãy điền số điện thoại");
                            return "";
                          }
                        },
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Số điện thoại",
                        ),
                        onSaved: (newValue) => _data["Phone"] = newValue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: "company",
                                groupValue: _role,
                                onChanged: (val) => setState(() {
                                  _role = val.toString();
                                  _data["Firstname"] = null;
                                }),
                              ),
                              const Text(
                                "Doanh Nghiệp",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: "normal",
                                groupValue: _role,
                                onChanged: (val) => setState(() {
                                  _role = val.toString();
                                  _data["Companyname"] = null;
                                }),
                              ),
                              const Text(
                                "Cá Nhân",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.red)),
                        child: (_role == "company")
                            ? Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.length > 100 ||
                                          value.isEmpty) {
                                        _showError("Nhận từ 1 đến 100 ký tự");
                                        return "";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Tên công ty",
                                    ),
                                    onSaved: (newValue) =>
                                        _data["Companyname"] = newValue,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Địa chỉ",
                                    ),
                                    onSaved: (newValue) =>
                                        _data["Companylocation"] = newValue,
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.length > 20 ||
                                          value.isEmpty) {
                                        _showError("Nhận từ 1 đến 20 ký tự");
                                        return "";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Họ",
                                    ),
                                    onSaved: (newValue) =>
                                        _data["Firstname"] = newValue,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.length > 10 ||
                                          value.isEmpty) {
                                        _showError("Nhận từ 1 đến 20 ký tự");
                                        return "";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Tên",
                                    ),
                                    onSaved: (newValue) =>
                                        _data["Lastname"] = newValue,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.length > 100 ||
                                          value.isEmpty) {
                                        _showError("Nhận từ 1 đến 100 ký tự");
                                        return "";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      labelText: "Ngày tháng năm sinh",
                                    ),
                                    onSaved: (newValue) =>
                                        _data["Birthday"] = newValue,
                                  ),
                                ],
                              ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: _register,
                        child: const Text(
                          "Đăng Ký",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
    );
  }
}
