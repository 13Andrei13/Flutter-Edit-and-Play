import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  const MyBarrier(
      {Key? key,
      required this.barrierHeight,
      required this.barrierWidth,
      required this.isThisBottomBarrier,
      required this.barrierX})
      : assert(barrierHeight != null),
        assert(isThisBottomBarrier != null),
        assert(barrierX != null),
        super(key: key);

  final double  barrierWidth; // out of 2, where 2 is the width of the screen
  final double  barrierHeight; // proportion of the screenheight
  final double barrierX;
  final bool isThisBottomBarrier;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth), isThisBottomBarrier ? 1 : -1),
      child: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width * barrierWidth / 2,
        height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
      ),
    );
  }
}
