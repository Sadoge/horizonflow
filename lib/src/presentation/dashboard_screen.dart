import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horizonflow/src/core/constants/text_styles.dart';
import 'package:horizonflow/src/providers/auth/auth_state_provider.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HorizonFlow',
          style: mediumLight,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authStateProvider.notifier).signOut();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Center(child: Text('Welcome user with email: ${user?.email}')),
    );
  }
}
