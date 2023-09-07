import 'package:flutter/material.dart';

class WelcomeContainerAnimation extends StatefulWidget {
  const WelcomeContainerAnimation({super.key, required this.child});
  final Widget child;
  @override
  WelcomeContainerAnimationState createState() => WelcomeContainerAnimationState();
}

class WelcomeContainerAnimationState extends State<WelcomeContainerAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    final tween = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    );

    _animation = tween.animate(_animationController);
    _animation = tween.animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn, // Apply fade-in effect
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
