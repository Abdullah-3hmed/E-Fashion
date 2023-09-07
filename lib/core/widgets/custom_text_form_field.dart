import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.type,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.label,
    this.onSuffixPress,
    this.hintText,
    this.onSubmit,
    this.borderRadius,
    this.enableBorderColor,
    this.onSaved,
    this.autofillHints,
    this.isEmail = false,
  });

  final TextEditingController? controller;
  final TextInputType type;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final bool isEmail;
  final String? label;
  final List<String>? autofillHints;
  final Function(String submittedText)? onSubmit;
  final Function(String? value)? onSaved;
  final VoidCallback? onSuffixPress;
  final String? hintText;
  final double? borderRadius;
  final Color? enableBorderColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? _obscuredText;

  @override
  void initState() {
    if (widget.obscureText == true) {
      _obscuredText = widget.obscureText!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.type,
        obscureText: _obscuredText ?? false,
        onSaved: widget.onSaved,
        autofillHints: widget.autofillHints,
        onFieldSubmitted: widget.onSubmit,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        decoration: InputDecoration(
          errorStyle: Theme.of(context).textTheme.bodySmall,
          hintText: widget.hintText,
          errorMaxLines: 1,
          prefixIcon: widget.prefixIcon == null
              ? null
              : Icon(
                  widget.prefixIcon,
                ),
          suffixIcon: IconButton(
            icon: Icon(buildSuffixIcon()),
            onPressed: () {
              if (_obscuredText != null) {
                setState(() {
                  _obscuredText = !_obscuredText!;
                });
              }
              widget.onSuffixPress;
            },
          ),
          labelText: widget.label,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          contentPadding: const EdgeInsets.all(15.0).r,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
            borderSide: BorderSide(
              color: widget.enableBorderColor ?? Theme.of(context).colorScheme.outline,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.0).r,
            borderSide: BorderSide(
              color: widget.enableBorderColor ?? Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        validator: (value) {
          if (widget.isEmail) {
            if (value!.isNotEmpty && !EmailValidator.validate(value)) {
              return "Enter a valid mail";
            }
          }
          if (value!.isEmpty) {
            return '${widget.label} required';
          }
          return null;
        },
      ),
    );
  }

  IconData? buildSuffixIcon() {
    if (_obscuredText == true) {
      return Iconsax.eye;
    } else if (_obscuredText == false) {
      return Iconsax.eye_slash;
    } else {
      return widget.suffixIcon;
    }
  }
}
