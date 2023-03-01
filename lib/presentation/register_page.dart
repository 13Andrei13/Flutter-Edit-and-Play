import 'package:am_proiect/actions/index.dart';
import 'package:am_proiect/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _rePassword = TextEditingController();

  bool _isLoading = false;

  void _onResult(AppAction action) {
    setState(() {
      _isLoading = false;
    });
    if (action is ErrorAction) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${action.error}')));
    } else {
      StoreProvider.of<AppState>(context).dispatch(const VerifyEmail());
      Navigator.pushReplacementNamed(context, '/verifyEmail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF4C54EF),
              Color(0xFF16A5FB),
            ],
          )),
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
                    'Hello there.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'FontR',
                    ),
                  ),
                  const Text(
                    'Create an account to continue',
                    style: TextStyle(
                        color: Color(0x98ebebeb), fontSize: 22, fontFamily: 'FontC', fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 5,
                  ),
                  Expanded(
                    flex: 80,
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
                                flex: 6,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                  style: const TextStyle(fontFamily: 'FontR'),
                                  controller: _email,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (String value) {},
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter an email address';
                                    } else if (!value.contains('@') || !value.contains('.')) {
                                      return 'Please enter a valid email address';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(),
                                flex: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                  style: const TextStyle(fontFamily: 'FontR'),
                                  controller: _fullName,
                                  decoration: const InputDecoration(
                                    labelText: 'Full Name',
                                  ),
                                  keyboardType: TextInputType.name,
                                  onChanged: (String value) {},
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    } else if (value.length < 4 || value.length > 24) {
                                      return 'Name must be between 4 and 24 characters';
                                    }

                                    if (value.contains(RegExp(r'[!-&]')) ||
                                        value.contains(RegExp(r'[(-@]')) ||
                                        value.contains(RegExp(r'[[-`]'))) {
                                      return 'Name must contain only letters';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(),
                                flex: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                  style: const TextStyle(fontFamily: 'FontR'),
                                  controller: _phoneNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'Phone Number',
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (String value) {},
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    } else if (value.length != 10 ||
                                        value[0] != '0' ||
                                        value[1] != '7' ||
                                        value.contains(RegExp(r'[!-/]')) ||
                                        value.contains(RegExp(r'[:-~]'))) {
                                      return 'Invalid phone number';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(),
                                flex: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                  style: const TextStyle(fontFamily: 'FontR'),
                                  controller: _password,
                                  decoration: const InputDecoration(
                                    labelText: 'Password',
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    } else if (value.length < 6 || value.length > 24) {
                                      return 'Password has to be between 6 and 24 characters';
                                    }

                                    if (!value.contains(RegExp(r'[!-`]'))) {
                                      return 'Password must contain a capital letter, a number or a symbol';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(),
                                flex: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: TextFormField(
                                  style: const TextStyle(fontFamily: 'FontR'),
                                  controller: _rePassword,
                                  decoration: const InputDecoration(
                                    labelText: 're-Password',
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  validator: (String? value) {
                                    if (value != _password.text) {
                                      return "Password doesn't match";
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(),
                                flex: 8,
                              ),
                              Builder(
                                builder: (BuildContext context) {
                                  if (_isLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      if (!Form.of(context)!.validate()) {
                                        return;
                                      }
                                      setState(() => _isLoading = true);
                                      StoreProvider.of<AppState>(context).dispatch(Register(
                                          _email.text, _password.text, _fullName.text, _phoneNumber.text, _onResult));
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
                                                'SIGN UP',
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
                                  );
                                },
                              ),
                              Expanded(
                                child: Container(),
                                flex: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Do you have an account? ',
                                    style: TextStyle(
                                      fontFamily: 'FontR',
                                      color: Color(0xFF575757),
                                      fontSize: 18,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/login');
                                    },
                                    child: const Text(
                                      'LogIn',
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
                                flex: 6,
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
      ),
    );
  }
}
