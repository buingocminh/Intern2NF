import 'package:flutter/material.dart';

class chat_create_dialog extends StatefulWidget {
  const chat_create_dialog({Key? key}) : super(key: key);

  @override
  _chat_create_dialogState createState() => _chat_create_dialogState();
}

class _chat_create_dialogState extends State<chat_create_dialog> {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final Map<String, dynamic> _data = {
    "Name": "",
    "Password": "",
  };
  bool? checkvalue = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "NHẬP TÊN NHÓM",
                style: TextStyle(fontSize: 24),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text("Mã Khóa"),
                  value: checkvalue,
                  onChanged: (val) {
                    setState(() {
                      checkvalue = val;
                    });
                  }),
              if (checkvalue == true)
                TextField(
                  controller: passController,
                  decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  _data['Name'] = nameController.text;
                  _data['Password'] = passController.text;
                  Navigator.pop(context, _data);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                child: Text("TẠO"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
