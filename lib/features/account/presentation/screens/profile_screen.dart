import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/util/assets_manager.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/core/widgets/blurred_background_image.dart';
import 'package:flutter_ecommerce/core/widgets/container_button.dart';
import 'package:flutter_ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter_ecommerce/core/widgets/secondary_button.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/shared/account_clipped_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlurredBackgroundImage(
            imagePath: AssetsManager.userTestImage,
            isLocalImage: false,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 62.h,
            child: CircleAvatar(
              radius: 60.w,
              backgroundImage: const CachedNetworkImageProvider(
                AssetsManager.userTestImage,
              ),
            ),
          ),
          Positioned(
            top: 62.h,
            right: 110.w,
            child: CircleAvatar(
              radius: 16.h,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                icon: const Icon(
                  Iconsax.edit_2,
                  color: Colors.white,
                  size: 18.0,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: -5.0,
            child: AccountClippedContainer(
              height: SizeManager.screenHeight * 0.75,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    ClippedContainerButton(
                      onTap: () {},
                      icon: Iconsax.arrow_left_24,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "Edit Profile",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18.sp,
                          ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    const CustomTextFormField(
                      type: TextInputType.name,
                      prefixIcon: Iconsax.user,
                      label: "Name",
                      hintText: "Tara Slander",
                      autofillHints: [AutofillHints.name],
                    ),
                    const CustomTextFormField(
                      type: TextInputType.name,
                      prefixIcon: Iconsax.call,
                      label: "Phone number",
                      hintText: "312 250 361 500",
                      autofillHints: [AutofillHints.telephoneNumber],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Center(
                      child: SecondaryButton(
                        buttonTitle: "Done",
                        onTap: () {},
                        width: 100.w,
                        height: 42.h,
                        backgroundColor: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
