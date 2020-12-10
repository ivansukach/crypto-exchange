import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class OpacityAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  OpacityAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = Tween(begin: 0.0, end: 1.0);

    return PlayAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: Duration(milliseconds: 1000),
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation,
        child: child
      ),
    );
  }
}
