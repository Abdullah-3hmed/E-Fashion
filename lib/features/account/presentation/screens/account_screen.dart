import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/util/assets_manager.dart';
import 'package:flutter_ecommerce/core/widgets/blurred_background_image.dart';
import 'package:flutter_ecommerce/features/account/presentation/component/account/account_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60.w,
                  backgroundImage: const CachedNetworkImageProvider(
                    AssetsManager.userTestImage,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Tara Slander",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          const AccountContainerComponent(),
        ],
      ),
    );
  }
}
