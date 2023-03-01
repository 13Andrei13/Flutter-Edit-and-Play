import 'dart:math';

import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class GuessNumberPage extends StatefulWidget {
  const GuessNumberPage({Key? key}) : super(key: key);

  @override
  _GuessNumberPageState createState() => _GuessNumberPageState();
}

class _GuessNumberPageState extends State<GuessNumberPage> {
  final TextEditingController _controller = TextEditingController();
  double v = 1;
  double numberInput = 0;
  double ok = 0;
  late Random randomNumber;
  String random1 = randomBetween(1, 100).toString();
  double random = 49;
  String text = 'Buna';

  void validate() {
    if (numberInput < random)
      text = 'You tried $numberInput Try higher';
    else if (numberInput > random)
      text = 'You tried $numberInput try lower';
    else if (numberInput == random)
      text = 'You tried $numberInput You guessed right.';
    else if (numberInput == -1 && random == -1) {
      text = 'Da';
    }
  }

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
                              Navigator.of(context).pushReplacementNamed('/gameMenu');
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
                            'Guess the number',
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
                                SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          width: double.infinity,
                                          child: const Text(
                                            "I'm thinking of a number between 1 and 100",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 28,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          width: double.infinity,
                                          child: const Text(
                                            "It's your turn to guess my number!",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        if (ok != 0) Text(text),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Card(
                                          elevation: 5,
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              children: <Widget>[
                                                const Text(
                                                  'Try a number',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                TextField(
                                                  controller: _controller,
                                                  decoration: InputDecoration(
                                                    labelText: 'Enter your number',
                                                    suffix: IconButton(
                                                      icon: const Icon(Icons.clear),
                                                      onPressed: () {
                                                        _controller.clear();
                                                      },
                                                    ),
                                                  ),
                                                  keyboardType: TextInputType.number,
                                                  onChanged: (String value) {
                                                    numberInput = double.parse(value);
                                                  },
                                                ),
                                                if (random == numberInput)
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        ok = 0;
                                                        numberInput = 0;
                                                        random1 = randomBetween(1, 100).toString();
                                                      });
                                                    },
                                                    child: const Text('Reset'),
                                                  ),
                                                if (random != numberInput)
                                                  TextButton(
                                                    onPressed: () {
                                                      _controller.clear();
                                                      if (ok == 0) {
                                                        setState(() {
                                                          random = double.parse(random1);
                                                          ok = 1;
                                                          validate();
                                                          print(random);
                                                          print(random1);
                                                        });
                                                      } else if (ok == 1 && random != numberInput)
                                                        setState(() {
                                                          validate();
                                                        });
                                                      else if (ok == 1 && random == numberInput)
                                                        setState(() {
                                                          validate();
                                                        });
                                                    },
                                                    child: const Text('Guess'),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                  flex: 80,
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
