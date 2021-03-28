import 'dart:math';

import 'package:flutter/material.dart';

import 'Card.dart';

class FlipCard extends StatefulWidget {
  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _flipAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AnimationStatus status = _controller.status;
          if (status == AnimationStatus.dismissed) {
            _controller.forward();
          } else if (status == AnimationStatus.completed) {
            _controller.reverse();
          }
        },
        child: Icon(Icons.flip),
      ),
      body: Center(
        child: AnimatedBuilder(
          builder: (BuildContext context, Widget child) {
            return Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(pi * _flipAnimation.value),
              child: _flipAnimation.value <= 0.5
                  ? CustomCard("Front", Colors.red)
                  : Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(pi),
                      child: CustomCard("Back", Colors.purpleAccent)),

              ///Now we have a problem that back card is also flipped so to fix this
            );
          },
          animation: _flipAnimation,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
