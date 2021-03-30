import 'package:flutter/material.dart';

class KButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const KButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 300.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.green[400],
            shadowColor: Colors.greenAccent,
            elevation: 8.0,
          ),
        ),
      ),
    );
  }
}
