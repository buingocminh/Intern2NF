import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job/src/views/widget/signin_page.dart';

abstract class AppUser {
  late String? ID;
  String? UserName;
  String? Password;
  String? Email;
  String? Phone;
  String? Role;
  String? Avatar;

  Future SignUp() async {
    print("singin with ${Role}");
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final _collectionReference =
        FirebaseFirestore.instance.collection('User').doc(UserName);
    try {
      // if (await _collectionReference.isEmpty == false)
      await _collectionReference.get().then((value) {
        if (value.exists) throw Exception("Username đã tồn tại");
      });

      await _auth
          .createUserWithEmailAndPassword(email: Email!, password: Password!)
          .then((value) => ID = value.user!.uid);
      await SaveData();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future SaveData() async {}
  // Future LogIn({required String email, required String password}) async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   try {
  //     var user = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Future SignOut() async {
    print("logout");
    await FirebaseAuth.instance.signOut();
  }
}

class CompanyUser extends AppUser {
  late String? CompanyName;
  late String? CompanyLocation;

  @override
  String? ID;
  @override
  String? UserName;
  @override
  String? Password;
  @override
  String? Email;
  @override
  String? Phone;
  @override
  String? Avatar;
  @override
  String? Role = "company";

  CompanyUser(
      {this.UserName,
      this.Password,
      this.Email,
      this.Phone,
      this.CompanyLocation,
      this.CompanyName,
      this.Avatar});
  @override
  Future SaveData() async {
    print("savingdata");
    final CollectionReference _collectionReference =
        FirebaseFirestore.instance.collection('User');
    await _collectionReference.doc(ID).set({
      "UserName": UserName,
      "Email": Email,
      "Phone": Phone,
      "Role": Role,
      "CompayName": CompanyName,
      "CompanyLocation": CompanyLocation,
    }).then((value) => print("saving done"));
  }
}

class NormalUsser extends AppUser {
  late String? LastName;
  late String? FirstName;
  late String? BirthDay;
  @override
  String? ID;
  @override
  String? UserName;
  @override
  String? Password;
  @override
  String? Email;
  @override
  String? Avatar;
  @override
  String? Phone;
  @override
  String? Role = "normal";
  NormalUsser(
      {this.UserName,
      this.Password,
      this.Email,
      this.Phone,
      this.Avatar,
      this.FirstName,
      this.LastName,
      this.BirthDay,
      this.ID});

  @override
  Future SaveData() async {
    final CollectionReference _collectionReference =
        FirebaseFirestore.instance.collection('User');
    _collectionReference.doc(ID).set({
      "UserName": UserName,
      "Email": Email,
      "Phone": Phone,
      "Role": Role,
      "LastName": LastName,
      "FirstName": FirstName,
      "BirthDay": BirthDay,
    });
  }
}
