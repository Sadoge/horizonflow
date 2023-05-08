import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horizonflow/src/features/auth/screens/create_account_screen.dart';
import 'package:horizonflow/src/features/auth/screens/login_screen.dart';
import 'package:horizonflow/src/features/dashboard_screen.dart';
import 'package:horizonflow/src/features/splash/splash_screen.dart';

final goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const CreateAccountScreen();
          },
        ),
      ],
    ),
  ],
);
