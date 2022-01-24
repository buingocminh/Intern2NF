import 'package:flutter/material.dart';

class Custom_footer extends StatelessWidget {
  const Custom_footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.search,
              size: 40,
            ),
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.push_pin,
                size: 40,
              )),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.link,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
