import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/auth_container_clipper.dart';

class AuthClippedContainer extends StatelessWidget {
  const AuthClippedContainer({super.key, required this.height, required this.child});
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AuthContainerClipper(),
      child: Container(
        height: height,
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: child,
      ),
    );
  }
}
