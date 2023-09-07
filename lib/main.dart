import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/app_routes_observer.dart';
import 'package:flutter_ecommerce/bloc_observer.dart';
import 'package:flutter_ecommerce/config/router/app_router.dart';
import 'package:flutter_ecommerce/config/theme/theme_manager.dart';
import 'package:flutter_ecommerce/core/util/size_manager.dart';
import 'package:flutter_ecommerce/injection_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeManager().init(context);
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: getIt<AppRouter>().config(
          navigatorObservers: () => [AppRoutesObserver(), AutoRouteObserver()],
        ),
        theme: ThemeManager.lightTheme(),
      ),
    );
  }
}
