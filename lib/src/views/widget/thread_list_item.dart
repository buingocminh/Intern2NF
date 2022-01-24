import 'package:flutter/material.dart';
import 'package:job/src/logic/models/thread.dart';

class Thread_list_item extends StatelessWidget {
  const Thread_list_item({Key? key, required this.thread}) : super(key: key);
  final Thread thread;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/src/view/ui/thread_screen',
          arguments: thread.ID),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "REVIEW  ${thread.Name}",
                style: TextStyle(fontSize: 20),
                overflow: TextOverflow.fade,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(right: 30),
                      color: Colors.grey,
                      child: Text("${thread.NumOfComment} lượt bàn tán")),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Text(
                        thread.Location,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
