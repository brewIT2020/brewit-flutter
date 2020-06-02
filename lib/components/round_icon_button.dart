import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.width, @required this.height, @required this.color, @required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 5.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: width,
        height: height,
      ),
      shape: CircleBorder(),
      fillColor: color,
    );
  }
}
