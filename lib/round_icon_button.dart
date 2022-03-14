import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.child, this.onClick});
  final IconData child;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      child: Icon(child),
      elevation: 0.0,
      shape: CircleBorder(),
      constraints: BoxConstraints(minHeight: 50.0, minWidth: 50.0),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
