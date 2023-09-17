import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountCustomRow extends StatelessWidget {
  const AccountCustomRow({
    super.key,
    required this.prefixIcon,
    required this.text,
    this.onTap,
    this.suffixWidget,
    this.tabbed = true,
  });

  final IconData prefixIcon;
  final Widget? suffixWidget;
  final String text;
  final bool tabbed;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tabbed ? onTap : null,
      child: Row(
        children: [
          Icon(
            prefixIcon,
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          suffixWidget ??
              const Icon(
                Iconsax.arrow_right_3,
              ),
        ],
      ),
    );
  }
}
