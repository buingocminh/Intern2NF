import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job/src/logic/models/app_user.dart';

class UserController extends GetxController {
  late var appuser;

  Future LogIn({required Map<String, dynamic> data}) async {
    try {
      await FirebaseFirestore.instance
          .collection("User")
          .where("UserName", isEqualTo: data["Username"])
          .get()
          .then((value) async {
        if (value.docs.isEmpty) {
          throw Exception("Sai tên đăng nhập hoặc mật khẩu");
        } else {
          var _data = value.docs[0];

          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _data["Email"], password: data["Password"].toString())
              .then((_) {
            if (_data["Role"] == "company") {
              appuser = CompanyUser(
                  UserName: _data["UserName"],
                  Email: _data["Email"],
                  Phone: _data["Phone"],
                  CompanyLocation: _data["CompanyLocation"],
                  CompanyName: _data["CompanyName"]);
            } else {
              appuser = NormalUsser(
                  UserName: _data["UserName"],
                  Email: _data["Email"],
                  Phone: _data["Phone"],
                  BirthDay: _data["BirthDay"],
                  FirstName: _data["FirstName"],
                  LastName: _data["LastName"]);
            }
          });
        }
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future GoogleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          var googleUser = FirebaseAuth.instance.currentUser!;
          appuser = NormalUsser(
              ID: googleUser.uid,
              FirstName: googleUser.displayName,
              Email: googleUser.email);
          await FirebaseFirestore.instance
              .collection("User")
              .doc(googleUser.uid)
              .get()
              .then((value) {
            if (!value.exists) {
              appuser.SaveData();
            }
          });
        });

        //print(curenusser!.);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future FacebookLogin() async {
    try {
      print("Login with facebook");
      final LoginResult res = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(res.accessToken!.token);
      await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((value) async {
        var facebookUser = FirebaseAuth.instance.currentUser!;
        appuser = NormalUsser(
            ID: facebookUser.uid,
            FirstName: facebookUser.displayName,
            Email: facebookUser.email);
        await FirebaseFirestore.instance
            .collection("User")
            .doc(facebookUser.uid)
            .get()
            .then((value) {
          if (!value.exists) {
            appuser.SaveData();
          }
        });
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future Logout() async {
    await FirebaseAuth.instance.signOut();
    await FacebookAuth.instance.logOut();
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
