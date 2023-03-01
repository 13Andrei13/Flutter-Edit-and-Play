import 'package:am_proiect/actions/index.dart';
import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:am_proiect/widgets/avatar_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                    Row(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                        ),
                        const AvatarCircle(
                          sizeWidth: 0.062,
                          avatarColorTx: Colors.white,
                          avatarColorBg: Color(0xaa7691EF),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.14,
                          child: FittedBox(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        user!.fullName,
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: const TextStyle(
                                          fontSize: 33,
                                          fontFamily: 'FontR',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      user.phoneNumber,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'FontC',
                                        color: Color(0xbbEBEBEB),
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
                    Expanded(
                      child: Container(),
                      flex: 12,
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
                                  flex: 13,
                                ),
                                GestureDetector(
                                  onTap: () {},
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
                                        Icons.mail_outline_sharp,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          5,
                                          0,
                                          10,
                                          0,
                                        ),
                                      ),
                                      Text(
                                        user.email.split('@').first,
                                        style: const TextStyle(
                                          fontFamily: 'FontR',
                                          fontSize: 23,
                                        ),
                                      ),
                                      const Text(
                                        '@',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        user.email.split('@').last,
                                        style: const TextStyle(
                                          fontFamily: 'FontR',
                                          fontSize: 23,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 8,
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








                                Row(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        5,
                                        0,
                                        30,
                                        0,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushReplacementNamed('/login');
                                        StoreProvider.of<AppState>(context).dispatch(const SignOut());
                                      },
                                      child: const Text(
                                        'Log out',
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontFamily: 'FontR',
                                          color: Color(0xFFA51C1C),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        5,
                                        0,
                                        30,
                                        0,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (user.photoUrl != null && user.photoUrl != '') {
                                          StoreProvider.of<AppState>(context).dispatch(const DeleteProfileUrl());
                                        }
                                      },
                                      child: const Text(
                                        'Account deactivation',
                                        style: TextStyle(
                                          fontSize: 23,
                                          fontFamily: 'FontB',
                                          color: Color(0x00A51C1C),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 70,
                                )
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
