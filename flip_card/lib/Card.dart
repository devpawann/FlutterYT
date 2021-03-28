import 'package:flutter/material.dart';

///This is a simple card that we will rotate
///Here we provide title and color so to separate front and back of card
class CustomCard extends StatelessWidget {
  final String title;
  final Color color;

  CustomCard(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 42, color: Colors.white),
      )),
    );
  }
}
