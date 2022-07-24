import 'package:flutter/material.dart';

const double cellWidth = 50;

class MultiplicationTableCell extends StatelessWidget {
  final int x;
  final int y;
  final Color? color;

  const MultiplicationTableCell({
    required this.x,
    required this.y,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      height: cellWidth,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '$x / $y',
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
