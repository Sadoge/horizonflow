import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horizonflow/src/core/constants/colors.dart';
import 'package:horizonflow/src/core/constants/text_styles.dart';
import 'package:horizonflow/src/features/auth/components/auth_textfield.dart';
import 'package:horizonflow/src/features/auth/providers/auth_state_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/login_background.png',
            fit: BoxFit.fitWidth,
          ),
          const Expanded(child: LoginForm()),
        ],
      ),
    );
  }
}

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Sign into your account', style: header3),
          const SizedBox(height: 24),
          AuthTextField(
            controller: emailController,
            labelText: 'Enter your email',
          ),
          const SizedBox(height: 8),
          AuthTextField(
            controller: passwordController,
            labelText: 'Enter your password',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.inactive,
                    foregroundColor: AppColors.textRegular,
                  ),
                  onPressed: () => context.go('/signup'),
                  child: const Text('SIGN UP'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: () async {
                    try {
                      await ref.read(authStateProvider.notifier).signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    } on AuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message.toString())),
                      );
                    }
                  },
                  child: const Text('SIGN IN'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
