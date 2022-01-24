import 'package:flutter/material.dart';

class thread_chat extends StatelessWidget {
  const thread_chat({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "https://placeimg.com/640/480/any",
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "User_name",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: " - ngày tháng, thời gian",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: (index % 2 == 0)
                          ? Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "................. he input method toggled\n cursor.......... ..... ..... ",
                                maxLines: null,
                                softWrap: true,
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                "https://placeimg.com/640/480/any",
                                fit: BoxFit.fill,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: SizedBox(),
                flex: 2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
