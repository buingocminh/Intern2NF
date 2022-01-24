import 'package:flutter/material.dart';
import 'package:job/src/logic/models/private_chat_model.dart';

class private_chat_list extends StatefulWidget {
  const private_chat_list({Key? key}) : super(key: key);

  @override
  _private_chat_listState createState() => _private_chat_listState();
}

class _private_chat_listState extends State<private_chat_list> {
  List<private_chat_model> list = [
    private_chat_model(UserName1: "1234567", UserName2: "abcdef"),
    private_chat_model(UserName1: "1234567", UserName2: "abcdef"),
    private_chat_model(UserName1: "1234567", UserName2: "abcdef"),
    private_chat_model(UserName1: "1234567", UserName2: "abcdef"),
  ];
  int _pickedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        if (_pickedIndex != index)
                          _pickedIndex = index;
                        else
                          _pickedIndex = -1;
                      }),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://placeimg.com/640/480/any",
                          height: 50,
                          width: 50,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, '/src/view/ui/private_chat_screen'),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].UserName2,
                              overflow: TextOverflow.fade,
                              style: TextStyle(fontSize: 20),
                            ),
                            Row(
                              children: [
                                Container(
                                  // check usser2 cos online hay k
                                  height: 5,
                                  width: 10,
                                  color: Colors.greenAccent,
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  "hiển thị tin nhắn đã đọc chưa",
                                  overflow: TextOverflow.fade,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_pickedIndex == index)
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: IconButton(
                              onPressed: null,
                              icon: Icon(Icons.call),
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.notifications_off_outlined)),
                          )
                        ],
                      ),
                    )
                ],
              ),
            );
          }),
    );
  }
}
