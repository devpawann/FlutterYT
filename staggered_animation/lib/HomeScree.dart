import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ScreenAnimator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ScreenAnimator screenAnimator;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.forward();
    screenAnimator = ScreenAnimator(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        //color: Colors.red,
        padding: EdgeInsets.all(20),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: screenAnimator.profileOpacity.value,
                  child: CircleAvatar(
                    child: Text("G"),
                    backgroundColor: Colors.red,
                    radius: 40,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Transform(
                        transform: Matrix4.translationValues(
                            screenAnimator.infoX.value, 0.0, 0.0),
                        child: Text("Pawan Acharya")),
                    SizedBox(height: 10),
                    Text("200 Subscriber"),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Subscribe"),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
