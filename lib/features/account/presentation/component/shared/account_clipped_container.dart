import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/shared/account_container_clipper.dart';

class AccountClippedContainer extends StatelessWidget {
  const AccountClippedContainer({super.key, required this.height, required this.child});
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AccountContainerClipper(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        color: Theme.of(context).colorScheme.onInverseSurface,
        height: height,
        child: child,
      ),
    );
  }
}
