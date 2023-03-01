// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:am_proiect/actions/index.dart';
// import 'package:am_proiect/models/index.dart';
import 'package:am_proiect/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        child: FloatingActionButton(
          child: const Icon(
            Icons.menu,
            color: Color(0xFF475BF0),
            size: 27,
          ),
          backgroundColor: Colors.white,
          mini: true,
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      backgroundColor: Colors.white,
      drawer: DrawerUerto(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF4C54EF),
              Color(0xFF16A5FB),
              Color(0xFF16A5FB),
            ],
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.09),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: const Text(
                            'Edit and Play',
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 50,
                              fontFamily: 'FontR',
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.09,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0001,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x20000000),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(1, 8),
                          ),
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(),
                              flex: 13,
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                              child: Card(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/gameMenu');
                                  },
                                  splashColor: Colors.blue,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Icon(
                                          Icons.videogame_asset,
                                          size: 70.0,
                                        ),
                                        Text(
                                          'Games',
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                              child: Card(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed('/editPhotoSelect');
                                  },
                                  splashColor: Colors.blue,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Icon(
                                          Icons.photo,
                                          size: 70.0,
                                        ),
                                        Text(
                                          'Photo Edit',
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
  }
}
