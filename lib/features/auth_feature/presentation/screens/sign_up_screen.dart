import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce/core/widgets/primary_button.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/auth_clipped_container.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/blurred_auth_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode _autoValidateMode;
  late String _userName;
  late String _password;
  late String _email;
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
            height: SizeManager.screenHeight * 0.65,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      "Sign up",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CustomTextFormField(
                      label: "user name",
                      prefixIcon: Iconsax.user,
                      type: TextInputType.name,
                      autofillHints: const [AutofillHints.username],
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
                      label: "Email",
                      isEmail: true,
                      prefixIcon: Icons.email_outlined,
                      autofillHints: const [AutofillHints.email],
                      type: TextInputType.emailAddress,
                      hintText: "Email",
                      onSaved: (email) {
                        if (email != null) {
                          _email = email;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      label: "Password",
                      obscureText: true,
                      prefixIcon: Iconsax.lock,
                      autofillHints: const [AutofillHints.password],
                      type: TextInputType.visiblePassword,
                      hintText: "Password",
                      onSaved: (password) {
                        if (password != null) {
                          _password = password;
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StatefulBuilder(builder: (context, StateSetter setState) {
                          return Checkbox(
                            value: _isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                _isChecked = newBool!;
                              });
                            },
                          );
                        }),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "I Agree with",
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: " Privacy",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                ),
                                TextSpan(
                                  text: " and",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: " policy",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PrimaryButton(
                      buttonTitle: "Sign up",
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
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        TextButton(
                          child: Text(
                            "Log in",
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          onPressed: () {
                            context.popRoute();
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
      ),
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
