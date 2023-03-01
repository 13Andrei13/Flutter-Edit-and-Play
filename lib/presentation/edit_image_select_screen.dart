import 'package:am_proiect/container/user_container.dart';
import 'package:am_proiect/models/index.dart';
import 'package:am_proiect/presentation/edit_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditImageSelectScreen extends StatefulWidget {
  const EditImageSelectScreen({Key? key}) : super(key: key);

  @override
  State<EditImageSelectScreen> createState() => _EditImageSelectScreenState();
}

class _EditImageSelectScreenState extends State<EditImageSelectScreen> {
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
                      child: SizedBox(
                        child: const Text(
                          'Upload your image',
                          style: TextStyle(
                            color:Colors.white,
                            fontSize: 50,
                            fontFamily: 'FontR',
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.10,
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
                                  flex: 30,
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.upload_file,
                                  ),
                                  onPressed: () async {
                                    final XFile? file = await ImagePicker().pickImage(
                                      source: ImageSource.gallery,
                                    );
                                    if (file != null) {
                                      Navigator.of(context).push<MaterialPageRoute>(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => EditImageScreen(
                                            selectedImage: file.path,
                                          ),
                                        ),
                                      );
                                    }
                                  },
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
