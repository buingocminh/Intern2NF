// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job/src/logic/controller/forum_controller.dart';
import 'package:job/src/views/widget/custom_footer.dart';
import 'package:job/src/views/widget/custom_header.dart';

import '../../logic/controller/job_controller.dart';
import '../../logic/models/thread.dart';
import '../widget/thread_list_item.dart';

class Forum_screen extends StatefulWidget {
  const Forum_screen({Key? key}) : super(key: key);

  @override
  _Forum_screenState createState() => _Forum_screenState();
}

class _Forum_screenState extends State<Forum_screen> {
  String _dropdowval = "Xem theo";
  final List<String> _listDropdown = ["Mới nhất", "Xem nhiều nhất"];
  static final ForumController _forumcontroller = Get.put(ForumController());
  Map<String, dynamic> sortby = {"Name": null, "SortBy": "Mới nhất"};
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print(thread.le)
    print(sortby);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            custom_header(),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Column(
                  children: [
                    Text("FORUM \"${Get.find<JobController>().JobSection}\""),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red)),
                                onPressed: () => Navigator.pushNamed(
                                    context, "/src/view/ui/group_chat"),
                                child: Text("Chat Nhóm"),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, '/src/view/ui/private_chat'),
                                child: Text("Chat"),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 4,
                                child: TextField(
                                  controller: _textController,
                                  onSubmitted: (value) => setState(() {
                                    sortby["Name"] = value.toString();
                                  }),
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () => setState(() {
                                          sortby["Name"] = null;
                                          _textController.clear();
                                        }),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      hintText: "Tìm Kiếm",
                                      // prefixIcon: Icon(Icons.search),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      )),
                                ),
                              ),
                              // Flexible(
                              //   child: SizedBox(),
                              //   flex: 1,
                              // ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: DropdownButton(
                                    dropdownColor: Colors.black,
                                    isExpanded: true,
                                    hint: Text(_dropdowval),
                                    //value: _dropdowval,
                                    items: _listDropdown
                                        .map((e) => DropdownMenuItem(
                                              child: Text(
                                                e,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              value: e,
                                            ))
                                        .toList(),
                                    onChanged: (value) => setState(() {
                                      sortby["SortBy"] = value.toString();
                                      _dropdowval = value.toString();
                                    }),
                                  ),
                                ),
                              )
                            ],
                          ),
                          //Expanded(child: Text("a")
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                          future: _forumcontroller.GetData(sortby),
                          builder: (ctx, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                List thread = snapshot.data as List;
                                print(thread.length);
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: thread.length,
                                  itemBuilder: (BuildContext ctx, int index) {
                                    // return Row(
                                    //   children: [Text("data")],
                                    // );
                                    return Thread_list_item(
                                        thread: thread[index]);
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text("Không có nhóm thỏa mãn"),
                                );
                              }
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                    )
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
