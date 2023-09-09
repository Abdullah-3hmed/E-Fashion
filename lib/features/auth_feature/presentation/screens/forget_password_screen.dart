import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/router/app_router.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce/core/widgets/primary_button.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/auth_clipped_container.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/blurred_auth_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidateMode;
  late String _email;

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
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: AuthClippedContainer(
            height: SizeManager.screenHeight * 0.60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Forget Password",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    textAlign: TextAlign.center,
                    "Enter the email address associated\n with your account",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    label: "Email",
                    obscureText: false,
                    prefixIcon: Icons.mail_outline,
                    type: TextInputType.text,
                    hintText: "Email",
                    isEmail: true,
                    autofillHints: const [AutofillHints.email],
                    onSaved: (value) {
                      if (value != null) {
                        _email = value;
                      }
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  PrimaryButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        context.pushRoute(const EmailVerificationRoute());
                      } else {
                        setState(() {
                          _autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    buttonTitle: 'Recover password',
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

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
