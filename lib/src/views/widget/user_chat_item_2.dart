import 'package:flutter/material.dart';

class user_chat_item_2 extends StatelessWidget {
  const user_chat_item_2({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 5,
            child: Card(
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
                  : Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          "https://placeimg.com/640/480/any",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
            ),
          ),
          Flexible(
            child: SizedBox(),
            flex: 2,
          ),
        ],
      ),
    );
  }
}
