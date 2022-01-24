import 'package:flutter/material.dart';
import 'package:job/src/views/widget/company_setting.dart';
import 'package:job/src/views/widget/user_change_dialog.dart';
import 'package:job/src/views/widget/user_setting.dart';

class user_setting_screen extends StatefulWidget {
  const user_setting_screen({Key? key}) : super(key: key);

  @override
  _user_setting_screenState createState() => _user_setting_screenState();
}

class _user_setting_screenState extends State<user_setting_screen> {
  // lấy role của user đang đăng nhặp  để kiểm tra
  bool _isUser = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.chevron_left,
                      size: 35,
                    )),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 20,
                          //check vip của user
                          color: Colors.grey,
                        ),
                        const Text(
                          "Tên User",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://placeimg.com/640/480/any",
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  //kiểm tra role vip của user, nếu có sẽ k hieent thị đoạn nàys
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: ElevatedButton(
                        child: const Text(
                          "NÂNG CẤP USER VIP",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: null,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            if (!_isUser) {
                              await showDialog(
                                  barrierColor: Colors.white,
                                  context: context,
                                  builder: (_) {
                                    return user_change_dialog(
                                        changeCordinate: "User");
                                  }).then((value) {
                                if (value != null) {
                                  setState(() {
                                    _isUser = true;
                                  });
                                }
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border(
                                right: const BorderSide(
                                    color: Colors.black, width: 1),
                                bottom: (!_isUser)
                                    ? const BorderSide(
                                        color: Colors.black, width: 1)
                                    : BorderSide.none,
                                top: (_isUser)
                                    ? const BorderSide(
                                        color: Colors.black, width: 1)
                                    : BorderSide.none,
                              ),
                            ),
                            child: Text(
                              "Cá Nhân",
                              style: TextStyle(
                                color: (_isUser) ? Colors.red : Colors.black,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            if (_isUser) {
                              await showDialog(
                                  barrierColor: Colors.white,
                                  context: context,
                                  builder: (_) {
                                    return user_change_dialog(
                                        changeCordinate: "Company");
                                  }).then((value) {
                                if (value != null) {
                                  setState(() {
                                    _isUser = false;
                                  });
                                }
                              });
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border(
                                right: const BorderSide(
                                    color: Colors.black, width: 1),
                                bottom: (_isUser)
                                    ? const BorderSide(
                                        color: Colors.black, width: 1)
                                    : BorderSide.none,
                                top: (!_isUser)
                                    ? const BorderSide(
                                        color: Colors.black, width: 1)
                                    : BorderSide.none,
                              ),
                            ),
                            child: Text(
                              "Doanh Nghiệp",
                              style: TextStyle(
                                color: (!_isUser) ? Colors.red : Colors.black,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_isUser) user_setting() else company_setting()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
