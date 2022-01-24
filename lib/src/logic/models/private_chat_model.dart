import 'package:job/src/logic/models/chat_message_model.dart';

class private_chat_model {
  String UserName1;
  String UserName2;
  bool U1Mute = false;
  bool U2mute = false;
  //list đã đc sắp xếp theo ngày tháng với thứ tự giảm dần
  List<message_model> list_message = [
    message_model(
        UserName: "abcdef",
        Content: "Reloaded 1 of 838 libraries in 1,580ms",
        datetime: DateTime.now(),
        Readed: false),
    message_model(
        UserName: "abcdef",
        Content: "https://placeimg.com/640/480/any",
        datetime: DateTime.now(),
        Readed: true),
    message_model(
        UserName: "abcdef",
        Content: "Reloaded 1 of 838 libraries in 1,580ms",
        datetime: DateTime.now().subtract(Duration(hours: 1)),
        Readed: false),
    message_model(
        UserName: "abcdef",
        Content: "Reloaded 1 of 838 libraries in 1,580ms",
        datetime: DateTime.now().subtract(Duration(days: 1)),
        Readed: true),
    message_model(
        UserName: "abcdef",
        Content: "Reloaded 1 of 838 libraries in 1,580ms",
        datetime: DateTime.now().subtract(Duration(days: 2)),
        Readed: true),
  ];

  private_chat_model({required this.UserName1, required this.UserName2});
}
