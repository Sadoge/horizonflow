import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horizonflow/src/presentation/auth/login_screen.dart';
import 'package:horizonflow/src/presentation/dashboard_screen.dart';
import 'package:horizonflow/src/providers/auth/auth_state_provider.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);

    return user != null ? const DashboardScreen() : const LoginScreen();
  }
}
