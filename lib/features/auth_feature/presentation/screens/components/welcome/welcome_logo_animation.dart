import 'package:flutter/material.dart';

class WelcomeLogoAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const WelcomeLogoAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<WelcomeLogoAnimation> createState() => _WelcomeLogoAnimationState();
}

class _WelcomeLogoAnimationState extends State<WelcomeLogoAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}
