class Job {
  final String Name;
  final int Price;
  final String Location;
  late int? MinSalary;
  late String? TypeOfSalary;
  late String? Time;
  late String? StartTime;
  late String? Exprequire;
  late String? WorkingPlace;
  late String? Subsidize;
  late bool IsChecked;
  late String? UserID;
  late String? ID;
  late int? NumOfView;
  Job(
      {required this.Name,
      required this.Price,
      required this.Location,
      this.MinSalary,
      this.StartTime,
      this.Time,
      this.Exprequire,
      this.UserID,
      this.Subsidize,
      this.IsChecked = false,
      this.TypeOfSalary,
      this.WorkingPlace,
      this.ID,
      this.NumOfView});
  void Data() {
    print(Name +
        Price.toString() +
        Location +
        MinSalary.toString() +
        TypeOfSalary.toString() +
        Time.toString() +
        StartTime.toString() +
        Exprequire.toString() +
        WorkingPlace.toString() +
        Subsidize.toString() +
        UserID.toString());
  }
}
