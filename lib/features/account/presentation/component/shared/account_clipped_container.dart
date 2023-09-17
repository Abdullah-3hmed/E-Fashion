import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/shared/account_container_clipper.dart';

class AccountClippedContainer extends StatelessWidget {
  const AccountClippedContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AccountContainerClipper(),
      child: Container(
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: child,
      ),
    );
  }
}
