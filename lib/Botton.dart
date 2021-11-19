import 'package:flutter/material.dart';

class Botton extends StatelessWidget {
  String text;
  Function onClick;

  Botton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
          onPressed: () {
            onClick(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          )),
    ));
  }
}
