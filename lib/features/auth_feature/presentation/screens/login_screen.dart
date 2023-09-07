import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/router/app_router.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce/core/widgets/primary_button.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/auth_clipped_container.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/blurred_auth_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// nothing
class _LoginScreenState extends State<LoginScreen> {
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidateMode;
  late String _userName;
  late String _password;
  bool _isChecked = false;

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
            height: SizeManager.screenHeight * 0.58,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Log in",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomTextFormField(
                    type: TextInputType.text,
                    prefixIcon: Iconsax.user,
                    autofillHints: const [AutofillHints.username],
                    label: "Username",
                    hintText: "Username",
                    onSaved: (userName) {
                      if (userName != null) {
                        _userName = userName;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    type: TextInputType.visiblePassword,
                    prefixIcon: Iconsax.lock,
                    suffixIcon: Iconsax.eye,
                    obscureText: true,
                    autofillHints: const [AutofillHints.password],
                    label: "Password",
                    hintText: "Password",
                    onSaved: (password) {
                      if (password != null) {
                        _password = password;
                      }
                    },
                  ),
                  Row(
                    children: [
                      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                        return Checkbox(
                          value: _isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              _isChecked = newBool!;
                            });
                          },
                        );
                      }),
                      Text(
                        "Remember me",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // context.pushRoute(const ForgetPasswordRoute());
                        },
                        child: Text(
                          "Forget Password",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  PrimaryButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      } else {
                        setState(() {
                          _autoValidateMode = AutovalidateMode.always;
                        });
                      }
                      // todo: replace route here
                    },
                    buttonTitle: "Log in",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      TextButton(
                        child: Text(
                          "Sign up",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        onPressed: () {
                          context.pushRoute(const SignUpRoute());
                        },
                      ),
                    ],
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
