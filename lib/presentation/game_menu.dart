import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:flutter/material.dart';

class GameMenu extends StatefulWidget {
  const GameMenu({Key? key}) : super(key: key);

  @override
  _GameMenuState createState() => _GameMenuState();
}

class _GameMenuState extends State<GameMenu> {
  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xFF4C54EF),
                  Color(0xFF16A5FB),
                ],
              ),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                      flex: 4,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(
                              25,
                              0,
                              5,
                              0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/main');
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.09),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: const Text(
                            'Play',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 50,
                              fontFamily: 'FontR',
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.10,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 5,
                    ),
                    Expanded(
                      flex: 150,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        child: Container(
                          color: Colors.white,
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Container(),
                                  flex: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/tiktaktoe');
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          35,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.gamepad,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          10,
                                          0,
                                        ),
                                      ),
                                      const Text(
                                        'Tik Tak Toe',
                                        style: TextStyle(
                                          fontFamily: 'FontC',
                                          fontSize: 23,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      const Divider(
                                        height: 0,
                                        thickness: 1.5,
                                        color: Color(0xFFE9E9E9),
                                        endIndent: 20,
                                        indent: 20,
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.017,
                                        child: const FittedBox(
                                          child: Icon(Icons.arrow_forward_ios),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          20,
                                          0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 7,
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 6,
                                  color: Color(0xFFE9E9E9),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 7,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/guessNumber');
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          35,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.gamepad_outlined,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          10,
                                          0,
                                        ),
                                      ),
                                      const Text(
                                        'Guess the number',
                                        style: TextStyle(
                                          fontFamily: 'FontC',
                                          fontSize: 23,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.017,
                                        child: const FittedBox(
                                          child: Icon(Icons.arrow_forward_ios),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          20,
                                          0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 7,
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 6,
                                  color: Color(0xFFE9E9E9),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 7,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/flappyBird');
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          35,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.games_outlined,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          10,
                                          0,
                                        ),
                                      ),
                                      const Text(
                                        'Flappy bird',
                                        style: TextStyle(
                                          fontFamily: 'FontC',
                                          fontSize: 23,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.017,
                                        child: const FittedBox(
                                          child: Icon(Icons.arrow_forward_ios),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          20,
                                          0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 7,
                                ),
                                const Divider(
                                  height: 0,
                                  thickness: 6,
                                  color: Color(0xFFE9E9E9),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 7,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/snake');
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          35,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.games_outlined,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          10,
                                          0,
                                        ),
                                      ),
                                      const Text(
                                        'Snake',
                                        style: TextStyle(
                                          fontFamily: 'FontC',
                                          fontSize: 23,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context).size.height * 0.017,
                                        child: const FittedBox(
                                          child: Icon(Icons.arrow_forward_ios),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          20,
                                          0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Container(),
                                  flex: 70,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
