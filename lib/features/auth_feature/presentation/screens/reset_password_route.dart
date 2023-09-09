import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce/core/widgets/primary_button.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/auth_clipped_container.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/blurred_auth_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidateMode;
  late String password;
  late String confirmPassword;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _autoValidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurredAuthBody(
        child: AuthClippedContainer(
          height: SizeManager.screenHeight * .60,
          child: Form(
            key: _formKey,
            autovalidateMode: _autoValidateMode,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "Reset Password",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    textAlign: TextAlign.center,
                    "Your new password must be different\n from previous used password.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    label: "Password",
                    obscureText: true,
                    prefixIcon: Iconsax.lock,
                    type: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.newPassword],
                    hintText: "Password",
                    onSaved: (value) {
                      if (value != null) {
                        password = value;
                      }
                    },
                  ),
                  CustomTextFormField(
                    label: "Confirm Password",
                    obscureText: true,
                    prefixIcon: Iconsax.lock,
                    type: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.newPassword],
                    hintText: "Password",
                    onSaved: (value) {
                      if (value != null) {
                        password = value;
                      }
                    },
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  PrimaryButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //  context.replaceRoute(const BottomNavBarRoute());
                      } else {
                        setState(() {
                          _autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    buttonTitle: 'Continue',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
