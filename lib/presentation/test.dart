                              Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      
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
                                                'Upload the diploma',
                                                style: TextStyle(
                                                  fontFamily: 'FontB',
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )