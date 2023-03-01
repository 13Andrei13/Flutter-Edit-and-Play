import 'package:am_proiect/actions/index.dart';
import 'package:am_proiect/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
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
                  child: const Text(
                    'Edit and Play',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 50,
                      fontFamily: 'FontR',
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Expanded(
                  child: Container(),
                  flex: 1,
                ),
                const Text(
                  'Email validation for',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'FontR',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StoreProvider.of<AppState>(context).state.user?.email != null
                              ? StoreProvider.of<AppState>(context).state.user!.email.split('@').first
                              : 'Nu exista',
                          style: const TextStyle(
                            fontFamily: 'FontC',
                            color: Color(0x98ebebeb),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '@',
                          style: TextStyle(
                            color: Color(0x98ebebeb),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          StoreProvider.of<AppState>(context).state.user?.email != null
                              ? StoreProvider.of<AppState>(context).state.user!.email.split('@').first
                              : 'Nu exista',
                          style: const TextStyle(
                            fontFamily: 'FontC',
                            color: Color(0x98ebebeb),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(),
                  flex: 4,
                ),
                Expanded(
                  flex: 70,
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
                              flex: 15,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              width: MediaQuery.of(context).size.height * 0.25,
                              child: FittedBox(
                                child: Image.asset('assets/images/image_prob_email.png'),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                              flex: 15,
                            ),
                            const Text(
                              'Please, verify your email.',
                              style: TextStyle(
                                color: Color(0xEE000000),
                                fontSize: 22,
                                fontFamily: 'FontR',
                              ),
                            ),
                            Expanded(
                              child: Container(),
                              flex: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacementNamed('/login');
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Color(0xFF327BF5),
                                        Color(0xFF258EF8),
                                      ],
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: MediaQuery.of(context).size.height * 0.008,
                                      ),
                                      child: const FittedBox(
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                            fontFamily: 'FontB',
                                            color: Colors.white,
                                            fontSize: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(),
                              flex: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Didn't recive the email? ",
                                  style: TextStyle(
                                    fontFamily: 'FontR',
                                    color: Color(0xFF575757),
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    StoreProvider.of<AppState>(context).dispatch(const VerifyEmail());
                                  },
                                  child: const Text(
                                    'Send Again',
                                    style: TextStyle(
                                      fontFamily: 'FontB',
                                      color: Color(0xFF2C84F6),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(),
                              flex: 10,
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
  }
}
