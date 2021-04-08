import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Key points:
/// 1. Animation classes like Animation, AnimationController and Tween have essentially just one purpose - generate values which can be used in the build method.
/// 2. AnimationController. It takes in a Duration and generates doubles with values between 0 (beginning) and 1 (end) in the specified time span.
/// 3. There's one additional step though - you have to tell this controller how many times per second it should progress toward the final value. For this, use a special ticker mixin on the widget containing the AnimationController. Depending on the device screen FPS, this ticker will "tick" 60 or maybe even 90 times per second. A new value will be generated on every tick.

class DvdMagicScreen extends StatelessWidget {
  const DvdMagicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SafeArea(
          child: Center(child: AnimationDVD()),
        ),
      );
}

class AnimationDVD extends StatefulWidget {
  const AnimationDVD({Key key}) : super(key: key);

  @override
  _AnimationDvdState createState() => _AnimationDvdState();
}

class _AnimationDvdState extends State<AnimationDVD> with SingleTickerProviderStateMixin {
  Animation<double> animationInPercent;
  Animation<Color> colorAnimation;
  AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: const Duration(seconds: 5),
      // This takes in the TickerProvider, which is this _AnimationPageState object
      vsync: this,
    );

    // final curvedAnimation = CurvedAnimation(
    //   parent: animController,
    //   curve: Curves.bounceIn,
    //   reverseCurve: Curves.easeOut,
    // );

    // animation = Tween<double>(
    //   begin: 0,
    //   end: 2 * math.pi,
    // ).animate(curvedAnimation)
    animationInPercent = Tween<double>(
      begin: 0,
      end: 1,
    ) // Chaining multiple Tweens will execute their "animation value modifications" sequentially
        .chain(CurveTween(curve: Curves.bounceIn))
        // Pass in the AnimationController directly again
        .animate(animController)
          ..addListener(() {
            // Empty setState because the updated value is already in the animation field
            setState(() {});
          })
          ..addStatusListener((status) {
            print('Status of the animation: ${status}');
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });

    // Goes from 0 to 1, we'll do something with these values later on
    animController.forward();
  }

  @override
  Widget build(BuildContext context) => Transform.rotate(
        angle: animationInPercent.value * math.pi * 2,
        child: Container(
          width: 200 * animationInPercent.value,
          height: 200 * animationInPercent.value,
          color: Colors.red.withOpacity(0.3),
          alignment: Alignment.center,
          child: Text(
            'Hello',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
