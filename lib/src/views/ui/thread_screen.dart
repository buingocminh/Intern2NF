import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/controller/forum_controller.dart';
import 'package:job/src/logic/models/thread.dart';
import 'package:job/src/views/widget/Thread_chat.dart';
import 'package:job/src/views/widget/custom_header.dart';

class thread_screen extends StatefulWidget {
  thread_screen({Key? key}) : super(key: key);

  @override
  State<thread_screen> createState() => _thread_screenState();
}

class _thread_screenState extends State<thread_screen> {
  Thread _thread =
      Thread(Name: "FTB", Location: "HN", NumOfComment: 100, ID: "1");
  final ForumController _forumcontroller = Get.find<ForumController>();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final String id = ModalRoute.of(context)?.settings.arguments as String;
    _thread = _forumcontroller.getForumbyID(id) as Thread;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            custom_header(
              title: _thread.Name,
            ),
            // Container(
            //   height: 500,
            //   child: Text("adsda"),
            // ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                child: ListView.builder(
                    reverse: true,
                    itemCount: 20,
                    itemBuilder: (BuildContext ctx, int index) {
                      // return Row(
                      //   children: [Text((100 - 1 - index).toString())],
                      // );
                      return thread_chat(
                        index: index,
                      );
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                    flex: 2,
                    child:
                        IconButton(onPressed: null, icon: Icon(Icons.image))),
                Flexible(
                    flex: 4,
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      maxLength: 500,
                    )),
                Flexible(
                  flex: 1,
                  child: IconButton(
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
