import 'package:flutter/material.dart';
import 'package:job/src/views/widget/custom_footer.dart';
import 'package:job/src/views/widget/custom_header.dart';
import 'package:job/src/views/widget/private_chat_list.dart';

class private_chat extends StatefulWidget {
  const private_chat({Key? key}) : super(key: key);

  @override
  _private_chatState createState() => _private_chatState();
}

class _private_chatState extends State<private_chat> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          custom_header(),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 6,
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
                      Flexible(
                        flex: 1,
                        child: IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, '/src/view/ui/private_chat_add_screen'),
                          icon: Icon(
                            Icons.add,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: private_chat_list())
                ],
              ),
            ),
          ),
          Custom_footer(),
        ],
      )),
    );
  }
}
