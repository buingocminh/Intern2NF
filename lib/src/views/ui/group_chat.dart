import 'package:flutter/material.dart';
import 'package:job/src/logic/models/grop_chat.dart';
import 'package:job/src/views/widget/custom_footer.dart';
import 'package:job/src/views/widget/custom_header.dart';
import 'package:job/src/views/widget/group_chat_create_dialog.dart';
import 'package:job/src/views/widget/group_chat_list.dart';

class Group_chat extends StatelessWidget {
  Group_chat({Key? key}) : super(key: key);
  List<group_chat> _group_chat_list = [
    group_chat(Name: "dev1", NumOfUser: 4000),
    group_chat(
        Name: "dev2...EGLSurface, EGLConfig, egl_winsys_surface ",
        NumOfUser: 5000,
        Password: "12345"),
    group_chat(Name: "dev1", NumOfUser: 4000),
    group_chat(Name: "dev1", NumOfUser: 4000),
    group_chat(Name: "dev1", NumOfUser: 4000),
  ];
  Future _showDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierColor: Color.fromRGBO(255, 255, 255, 0.7),
        builder: (_) {
          return chat_create_dialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            custom_header(),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "CÁC NHÓM CHAT ĐANG HOẠT ĐỘNG",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () async {
                              var res = await _showDialog(context);
                              print(res);
                            },
                            icon: Icon(
                              Icons.add,
                              size: 30,
                            )),
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: _group_chat_list.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return group_chat_list(
                                  group: _group_chat_list[index]);
                            }))
                  ],
                ),
              ),
            ),
            Custom_footer(),
          ],
        ),
      ),
    );
  }
}
