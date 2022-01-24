import 'package:flutter/material.dart';
import 'package:job/src/views/widget/custom_header.dart';
import 'package:job/src/views/widget/thread_chat.dart';
import 'package:job/src/views/widget/user_chat_item.dart';

class group_chat_screen extends StatelessWidget {
  const group_chat_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            custom_header(
              title: "Tên của nhóm ở đây abcdefghink",
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                child: ListView.builder(
                    reverse: true,
                    itemCount: 20,
                    itemBuilder: (BuildContext ctx, int index) {
                      // nếu k phải là user gửi thì trả về dạng như chat forum
                      if (index % 2 == 0)
                        return thread_chat(
                          index: index,
                        );
                      //nếu là user gửi thì trả về chat custom của user
                      else
                        return user_chat_item(index: index + 1);
                    }),
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 2,
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.image_outlined,
                    ),
                    iconSize: 40,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.emoji_emotions),
                    iconSize: 40,
                  ),
                  flex: 2,
                ),
                Flexible(
                    flex: 6,
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      maxLength: 500,
                    )),
                Flexible(
                  flex: 1,
                  child: IconButton(
                    iconSize: 40,
                    onPressed: null,
                    icon: ImageIcon(
                      AssetImage("assets/icon/airplane.png"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
