import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/router/app_router.dart';
import 'package:flutter_ecommerce/core/util/colors_manager.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/core/widgets/container_button.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/account/account_custom_row.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/shared/account_clipped_container.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/shared/icon_switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AccountContainerComponent extends StatelessWidget {
  const AccountContainerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                icon: Iconsax.logout5,
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Text(
                  "Profile Settings",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 18.sp,
                      ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              AccountCustomRow(
                prefixIcon: Iconsax.user,
                text: "My Profile",
                onTap: () {
                  context.pushRoute(const ProfileRoute());
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(const LocationRoute());
                },
                text: "Location",
                prefixIcon: Iconsax.location,
              ),
              SizedBox(
                height: 24.h,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(const OrderStatusRoute());
                },
                text: "Orders Status",
                prefixIcon: Iconsax.bag_2,
              ),
              SizedBox(
                height: 24.h,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(
                    const ChatSupportRoute(),
                  );
                },
                text: "Chat Support",
                prefixIcon: Iconsax.message,
              ),
              SizedBox(
                height: 24.h,
              ),
              AccountCustomRow(
                onTap: () {
                  context.pushRoute(
                    const ChangePasswordRoute(),
                  );
                },
                text: "Change Password",
                prefixIcon: Iconsax.lock,
              ),
              SizedBox(
                height: 14.h,
              ),
              AccountCustomRow(
                text: "Notifications",
                prefixIcon: Iconsax.notification,
                suffixWidget: IconSwitcher(
                  initialSwitcherValue: false,
                  activeTrackColor: Theme.of(context).colorScheme.error,
                  activeIconColor: Colors.white,
                  activeThumbColor: Colors.white,
                  disabledTrackColor: ColorsManager.successColor,
                  onChanged: (switched) {},
                  activeIcon: Icons.notifications_off_outlined,
                  disabledIcon: Icons.notifications_active_outlined,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              AccountCustomRow(
                text: "App Theme",
                prefixIcon: Iconsax.sun_1,
                suffixWidget: IconSwitcher(
                  initialSwitcherValue: false,
                  onChanged: (switched) {
                    debugPrint(switched.toString());
                  },
                  activeIcon: Iconsax.sun_1,
                  disabledIcon: Iconsax.moon5,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
