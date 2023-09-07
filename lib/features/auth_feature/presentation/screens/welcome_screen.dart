import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/config/router/app_router.dart';
import 'package:flutter_ecommerce/core/util/assets_manager.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/welcome/spinning_animation.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/welcome/welcome_container_antimation.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/welcome/welcome_logo_animation.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/welcome/welcome_screen_container_clipper.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/components/welcome/welcome_text_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            context.pushRoute(const LoginRoute());
          }
        },
        child: Stack(
          children: [
            const Image(
              fit: BoxFit.cover,
              height: double.infinity,
              image: AssetImage(
                AssetsManager.welcomeImage,
              ),
            ),
            const Positioned(
              left: 0.0,
              right: 0.0,
              child: WelcomeLogoAnimation(
                child: Image(
                  image: AssetImage(AssetsManager.appLogo),
                ),
              ),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: -5,
              child: WelcomeContainerAnimation(
                child: ClipPath(
                  clipper: WelcomeScreenContainerClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
                    child: Container(
                      color: const Color(0xFF001D34).withOpacity(0.5),
                      height: 300.h,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20,
                            bottom: 100,
                            child: WelcomeTextAnimation(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Start your new \nhopping experience",
                                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Text(
                                    "For fancy clothes and accessories",
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 273.w,
                            bottom: 142.h,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                SizedBox(
                                  width: 80.w,
                                  height: 80.h,
                                  child: const SpinningAnimation(
                                    child: Image(
                                      image: AssetImage(AssetsManager.welcomeCircleImage),
                                    ),
                                  ),
                                ),
                                const Image(
                                  image: AssetImage(AssetsManager.welcomeCircleArrow),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
