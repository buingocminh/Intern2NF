class Thread {
  final String ID;
  final String Name;
  final String? Password;
  final String Location;
  final int NumOfComment;
  Thread(
      {required this.Name,
      required this.Location,
      this.Password,
      required this.NumOfComment,
      required this.ID});
}
