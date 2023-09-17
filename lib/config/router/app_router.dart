import 'package:auto_route/auto_route.dart';
import 'package:flutter_ecommerce/features/account/presentation/screens/account_screen.dart';
import 'package:flutter_ecommerce/features/account/presentation/screens/changa_password.dart';
import 'package:flutter_ecommerce/features/account/presentation/screens/chat_support.dart';
import 'package:flutter_ecommerce/features/account/presentation/screens/delivery_status_screen.dart';
import 'package:flutter_ecommerce/features/account/presentation/screens/location_screen.dart';
import 'package:flutter_ecommerce/features/account/presentation/screens/order_status_screen.dart';
import 'package:flutter_ecommerce/features/account/presentation/screens/profile_screen.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/email_verification_screen.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/forget_password_screen.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/reset_password_route.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/sign_up_screen.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/splash_screen.dart';
import 'package:flutter_ecommerce/features/auth_feature/presentation/screens/welcome_screen.dart';
import 'package:flutter_ecommerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter_ecommerce/features/home_feature/presentation/screens/home_screen.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
@singleton
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          children: [
            AutoRoute(
              page: SplashRoute.page,
            ),
            CustomRoute(
              page: WelcomeRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: LoginRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: SignUpRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: ForgetPasswordRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: EmailVerificationRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: ResetPasswordRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
          ],
        ),
        AutoRoute(
          page: HomeTabRoute.page,
          children: [
            CustomRoute(
              page: HomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
          ],
        ),
        AutoRoute(
          page: AccountTabRoute.page,
          initial: true,
          children: [
            CustomRoute(
              page: AccountRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: ProfileRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: ChangePasswordRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: LocationRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: DeliveryStatusRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: ChatSupportRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
            CustomRoute(
              page: OrderStatusRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
          ],
        ),
        AutoRoute(
          page: CartTabRoute.page,
          children: [
            CustomRoute(
              page: CartRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              durationInMilliseconds: 300,
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'AuthRoute')
class Auth extends AutoRouter {
  const Auth({super.key});
}

@RoutePage(name: 'HomeTabRoute')
class HomeTab extends AutoRouter {
  const HomeTab({super.key});
}

@RoutePage(name: 'CartTabRoute')
class CartTab extends AutoRouter {
  const CartTab({super.key});
}

@RoutePage(name: 'FavoriteTabRoute')
class FavoriteTab extends AutoRouter {
  const FavoriteTab({super.key});
}

@RoutePage(name: 'AccountTabRoute')
class AccountTab extends AutoRouter {
  const AccountTab({super.key});
}
