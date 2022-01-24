import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job/src/logic/models/grop_chat.dart';

class group_chat_list extends StatelessWidget {
  group_chat_list({Key? key, required this.group}) : super(key: key);
  final group_chat group;
  Future _showdialog(BuildContext ctx) async {
    final textController = TextEditingController();
    return await showDialog(
        context: ctx,
        barrierColor: Color.fromRGBO(255, 255, 255, 0.7),
        builder: (_) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
            title: const Text("Nhập Mật Khẩu"),
            content: TextField(
              controller: textController,
              decoration: const InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx, textController.text);
                    },
                    child: Text("Tham Gia"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                  )
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (group.Password != null) {
          var pas = await _showdialog(context);
          if (pas.toString() == group.Password) {
            Navigator.pushNamed(context, '/src/view/ui/group_chat_screen');
          }
          //print(pas);
        } else {
          Navigator.pushNamed(context, '/src/view/ui/group_chat_screen');
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.Name,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Card(
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: RichText(
                        text: TextSpan(
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                            children: [
                              TextSpan(
                                  text: NumberFormat.compactCurrency(
                                          decimalDigits: 1, symbol: '')
                                      .format(group.NumOfUser)),
                              WidgetSpan(
                                  child: Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                              ))
                            ]),
                      ),
                    )
                  ],
                )),
            if (group.Password != null)
              Flexible(
                  flex: 1, child: ImageIcon(AssetImage("assets/icon/key.png")))
          ],
        ),
      ),
    );
  }
}
