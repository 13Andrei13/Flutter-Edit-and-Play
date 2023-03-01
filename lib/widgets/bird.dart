import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({
    Key? key,
    required this.birdY,
    required this.birdWidth,
    required this.birdHeight,
  })  : assert(birdY != null),
        assert(birdWidth != null),
        assert(birdHeight != null),
        super(key: key);

  final double  birdY;
  final double birdWidth; // normal double value for width.
  final double birdHeight; // out of 2, 2 being the entire height of the screen

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0, (2 * birdY + birdHeight) / (2 - birdHeight)),
        child: Image.asset(
          'assets/images/bird.png',
          width: MediaQuery.of(context).size.height * birdWidth / 2,
          height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight / 2,
          fit: BoxFit.fill,
        ));
  }
}