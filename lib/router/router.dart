import 'package:base_project/features/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routers.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.home.toPath(),
      name: AppRoutes.home.toPath(),
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    )
  ],
);
