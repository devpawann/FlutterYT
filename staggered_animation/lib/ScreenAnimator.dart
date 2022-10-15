import 'package:flutter/animation.dart';

class ScreenAnimator {
  AnimationController controller;
  Animation<double> profileOpacity;
  Animation<double> infoX;
  Animation<double> infoOpacity;
  Animation<double> placeHolderOpacity;
  Animation<double> buttonPop;
  ScreenAnimator(this.controller) {
    profileOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.2, curve: Curves.easeIn)));
    infoOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: controller, curve: Interval(0.25, 0.4, curve: Curves.easeIn)),
    );
    infoX = Tween(begin: 35.0, end: 0.0).animate(
      CurvedAnimation(
          parent: controller,
          curve: Interval(0.25, 0.35, curve: Curves.easeIn)),
    );
  }
}
