import 'package:flutter/material.dart';
import 'package:job/src/logic/models/private_chat_model.dart';
import 'package:job/src/views/widget/private_chat_timestamp.dart';
import 'package:job/src/views/widget/user_chat_item.dart';
import 'package:job/src/views/widget/user_chat_item_2.dart';

class private_chat_screen extends StatefulWidget {
  const private_chat_screen({Key? key}) : super(key: key);

  @override
  _private_chat_screenState createState() => _private_chat_screenState();
}

class _private_chat_screenState extends State<private_chat_screen> {
  private_chat_model chat =
      private_chat_model(UserName1: "1234567", UserName2: "abcdef");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.chevron_left,
                          size: 35,
                        )),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "https://placeimg.com/640/480/any",
                        width: 40,
                        height: 40,
                      ),
                    ),
                    Text(
                      "Tên User",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(
                          context, '/src/view/ui/video_call_screen'),
                      icon: ImageIcon(
                        AssetImage("assets/icon/video-camera.png"),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pushNamed(
                          context, '/src/view/ui/call_screen'),
                      icon: Icon(Icons.phone_in_talk_outlined),
                    ),
                    if (chat.U1Mute == true)
                      IconButton(
                          onPressed: null,
                          icon: Icon(Icons.notifications_off_outlined))
                  ],
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: chat.list_message.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    children: [
                      if (DateTime.now()
                                  .difference(chat.list_message[index].datetime)
                                  .inMinutes >
                              30 ||
                          (chat.list_message[index].datetime
                                      .difference(
                                          chat.list_message[index + 1].datetime)
                                      .inMinutes >
                                  30 &&
                              index + 1 < chat.list_message.length))
                        chat_time_stamp(
                            chattime: chat.list_message[index].datetime),
                      if (index % 2 == 0)
                        user_chat_item_2(index: index)
                      else
                        user_chat_item(index: index),
                    ],
                  );
                },
              ),
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: const [
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
