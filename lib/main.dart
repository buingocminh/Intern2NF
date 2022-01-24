import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:job/src/views/ui/add_job.dart';
import 'package:job/src/views/ui/call_screen.dart';
import 'package:job/src/views/ui/forgot_password_screen.dart';
import 'package:job/src/views/ui/forum_screen.dart';
import 'package:job/src/views/ui/group_chat.dart';
import 'package:job/src/views/ui/group_chat_screen.dart';
import 'package:job/src/views/ui/job_info_screen.dart';
import 'package:job/src/views/ui/job_searching.dart';
import 'package:job/src/views/ui/new_password_screen.dart';
import 'package:job/src/views/ui/private_chat.dart';
import 'package:job/src/views/ui/private_chat_screen.dart';
import 'package:job/src/views/ui/thread_screen.dart';
import 'package:job/src/views/ui/user_setting_screen.dart';
import 'package:job/src/views/ui/video_call_screen.dart';

import 'src/views/ui/login_signup_screen.dart';
import 'src/views/ui/Master.dart';
import 'src/views/ui/home.dart';
import 'src/views/ui/private_chat_add_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (ctx) => MyHomePage(),
        "/src/views/ui/Master": (ctx) => MasterPage(),
        '/src/view/ui/login': (ctx) => Login_Signup(),
        '/src/view/ui/job_searching': (ctx) => Job_searching(),
        '/src/view/ui/job_info_screen': (ctx) => job_info_screen(),
        '/src/view/ui/forum_screen': (ctx) => Forum_screen(),
        '/src/view/ui/thread_screen': (ctx) => thread_screen(),
        '/src/view/ui/group_chat': (ctx) => Group_chat(),
        '/src/view/ui/group_chat_screen': (ctx) => group_chat_screen(),
        '/src/view/ui/private_chat': (ctx) => private_chat(),
        '/src/view/ui/private_chat_screen': (ctx) => private_chat_screen(),
        '/src/view/ui/private_chat_add_screen': (ctx) =>
            private_chat_add_screen(),
        '/src/view/ui/video_call_screen': (ctx) => video_call_screen(),
        '/src/view/ui/call_screen': (ctx) => call_screen(),
        '/src/view/ui/add_job': (ctx) => add_job(),
        '/src/view/ui/user_setting_screen': (ctx) => user_setting_screen(),
        '/src/view/ui/forgot_password_screen': (ctx) =>
            forgot_password_screen(),
        '/src/view/ui/new_pasword_screen': (ctx) => new_password_screen(),
      },
    );
  }
}
