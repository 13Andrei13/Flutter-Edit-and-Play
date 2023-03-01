import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:am_proiect/presentation/login_page.dart';
import 'package:am_proiect/presentation/verify_email_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        if (user == null)
          return const LoginPage();
        else if (FirebaseAuth.instance.currentUser!.emailVerified)
          return const MainPage();
        else
          return const VerifyEmailPage();
      },
    );
  }
}
