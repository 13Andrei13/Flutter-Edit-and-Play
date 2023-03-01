import 'package:am_proiect/models/index.dart';
import 'package:am_proiect/presentation/about_page.dart';
import 'package:am_proiect/presentation/edit_image_select_screen.dart';
import 'package:am_proiect/presentation/flappy_bird_screen.dart';
import 'package:am_proiect/presentation/game_menu.dart';
import 'package:am_proiect/presentation/guess_number_page.dart';
import 'package:am_proiect/presentation/initialize_picker_page.dart';
import 'package:am_proiect/presentation/login_page.dart';
import 'package:am_proiect/presentation/main_page.dart';
import 'package:am_proiect/presentation/profile_page.dart';
import 'package:am_proiect/presentation/register_page.dart';
import 'package:am_proiect/presentation/tiktaktoe_page.dart';
import 'package:am_proiect/presentation/verify_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './mixin/init_mixin.dart';

void main() {
  /// ---------RunApp-----------------
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with InitMixin<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store<AppState>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<Store<AppState>> snapshot) {
        if (snapshot.hasData) {
          final Store<AppState> store = snapshot.data!;
          return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
              title: 'Mobile Games and Photo Editor App',
              routes: <String, WidgetBuilder>{
                '/': (BuildContext context) => const InitPage(),
                '/main': (BuildContext context) => const MainPage(),
                '/register': (BuildContext context) => const RegisterPage(),
                '/login': (BuildContext context) => const LoginPage(),
                '/verifyEmail': (BuildContext context) => const VerifyEmailPage(),
                '/profile': (BuildContext context) => const ProfilePage(),
                '/gameMenu': (BuildContext context) => const GameMenu(),
                '/tiktaktoe': (BuildContext context) => const TikTakToePage(),
                '/guessNumber': (BuildContext context) => const GuessNumberPage(),
                '/editPhotoSelect': (BuildContext context) => const EditImageSelectScreen(),
                '/aboutPage': (BuildContext context) => const AboutPage(),
                '/flappyBird': (BuildContext context) => const FlappyBird(),
              },
            ),
          );
        } else {
          if (snapshot.hasError) {
            throw snapshot.error!;
          }

          return const MaterialApp(
            title: 'Edit and Play',
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
