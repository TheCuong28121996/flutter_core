import 'package:base_project/data/repositories/repositories.dart';
import 'package:base_project/features/navigation/navigation_page.dart';
import 'package:base_project/features/pages.dart';
import 'package:base_project/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'routers.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.home.toPath(),
      name: AppRoutes.home.toPath(),
      redirect: (context, state) {
        final prefs = getIt<SharedPreferencesRepository>();

        if (prefs.isLoggedIn) {
          return null;
        }
        return AppRoutes.login.toPath();
      },
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: AppRoutes.login.toPath(),
      name: AppRoutes.login.toPath(),
      builder: (ctx, state) {
        return BlocProvider<LoginBloc>(
          create: (blocContext){
            return LoginBloc(authRepository: getIt<AuthenticationRepository>());
          },
          child: const LoginPage(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.navigation.toPath(),
      name: AppRoutes.navigation.toPath(),
      builder: (ctx, state) {
        return const NavigationPage();
      },
    ),
  ],
);
