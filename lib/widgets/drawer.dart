import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:am_proiect/widgets/avatar_circle.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DrawerUerto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        return Drawer(
          child: ListView(
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: DrawerHeader(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  margin: const EdgeInsets.only(bottom: 0.0),
                  child: Row(
                    children: <Widget>[
                      const AvatarCircle(
                        sizeWidth: 0.068,
                        avatarColorTx: Colors.black,
                        avatarColorBg: Color(0xffEEEEEE),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.148,
                        child: FittedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    user!.fullName.split(' ').first,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'FontR',
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/profile');
                                  },
                                  child: const Text(
                                    'view profile',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'FontC',
                                      color: Color(0xFF7B7B7B),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 30,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/aboutPage');
                    },
                    child: const Text(
                      'About',
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xFF363636), fontFamily: 'FontR', fontSize: 23),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
