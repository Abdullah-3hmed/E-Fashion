import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/util/assets_manager.dart';

class SpinningAnimation extends StatefulWidget {
  const SpinningAnimation({super.key});

  @override
  SpinningAnimationState createState() => SpinningAnimationState();
}

class SpinningAnimationState extends State<SpinningAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Image.asset(
              AssetsManager.welcomeCircleImage,
            ),
          ),
        ),
      ],
    );
  }
}
