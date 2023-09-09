import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/router/app_router.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/core/widgets/primary_button.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/auth_clipped_container.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/blurred_auth_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String _verifyCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredAuthBody(
        child: AuthClippedContainer(
          height: SizeManager.screenHeight * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Email verification",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  textAlign: TextAlign.center,
                  "Enter the 6 digital code the sent to\n your email address",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Pinput(
                  length: 6,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  onChanged: (value) {},
                  onCompleted: (value) {
                    _verifyCode = value;
                  },
                  defaultPinTheme: PinTheme(
                    width: 40.w,
                    height: 40.w,
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ).r,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75.h,
                ),
                PrimaryButton(
                  onTap: () {
                    if (_verifyCode.isNotEmpty) {
                      context.replaceRoute(const ResetPasswordRoute());
                      debugPrint(_verifyCode);
                    }
                  },
                  buttonTitle: 'Verify and proceed',
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
