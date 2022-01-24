import 'package:flutter/material.dart';

class private_chat_add_screen extends StatefulWidget {
  const private_chat_add_screen({Key? key}) : super(key: key);

  @override
  _private_chat_add_screenState createState() =>
      _private_chat_add_screenState();
}

class _private_chat_add_screenState extends State<private_chat_add_screen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.chevron_left,
                    size: 35,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Tìm Kiếm",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => _controller.clear(),
                            icon: Icon(Icons.clear_rounded),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext ctx, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              // mainAxisAlignment: ,
                              children: [
                                Flexible(
                                  flex: 2,
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
                                Expanded(
                                  flex: 6,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "abcdef",
                                          overflow: TextOverflow.fade,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Container(
                                          // check usser2 cos online hay k
                                          height: 5,
                                          width: 20,
                                          color: Colors.greenAccent,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    child: TextButton(
                                      onPressed: null,
                                      child: Text(
                                        "CHỌN",
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
