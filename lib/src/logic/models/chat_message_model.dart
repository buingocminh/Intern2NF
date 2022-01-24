class message_model {
  String UserName;
  DateTime datetime;
  String Content;
  bool Readed;

  message_model(
      {required this.UserName,
      required this.Content,
      required this.datetime,
      this.Readed = false});
}
