import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../injection/injection.dart';
import '../pages/login/login.dart';
import '../pages/navigation/navigation.dart';
import '../repositories/repositories.dart';
import 'routers.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
  initialLocation: AppRoutes.navigation.toPath(),
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.login.toPath(),
      name: AppRoutes.login.toPath(),
      builder: (ctx, state) {
        return BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            sharedPreferencesRepository: getIt<SharedPreferencesRepository>(),
            authRepository: getIt<AuthenticationRepository>(),
          ),
          child: const LoginPage(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.navigation.toPath(),
      name: AppRoutes.navigation.toPath(),
      redirect: (context, state) {
        final prefs = getIt<SharedPreferencesRepository>();

        if (prefs.isLoggedIn) {
          return null;
        }

        return AppRoutes.login.toPath();
      },
      builder: (ctx, state) {
        return BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: const NavigationPage(),
        );
      },
    ),
  ],
);
