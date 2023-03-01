import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String textAboutUs = 'Aceasta este o aplicație in care '
      'utilizatorul poate regăsi pe de o parte '
      'editare de imagine, acest lucru ajutându-l pe '
      'utilizator sa își editeze pozele personale si '
      'pe de alta parte poate sa regăsească parte de jocuri,'
      ' acest lucru ajutându-l sa se relaxeze.';

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
                            'About Us',
                            style: TextStyle(
                              color: Colors.white,
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
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text(
                                    textAboutUs,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
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
