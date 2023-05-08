import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horizonflow/src/core/constants/colors.dart';
import 'package:horizonflow/src/core/constants/text_styles.dart';
import 'package:horizonflow/src/features/auth/components/auth_textfield.dart';
import 'package:horizonflow/src/features/auth/providers/auth_state_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccountScreen extends HookConsumerWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authStateProvider,
      (prev, state) {
        if (state != null) {
          context.pop();
        }
      },
    );

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/login_background.png',
                  fit: BoxFit.fitWidth,
                ),
                const Positioned(
                  left: 24,
                  top: 24,
                  child: BackButton(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SignUpForm(),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulHookConsumerWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  bool _hasAcceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Create new account',
            style: header3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AuthTextField(
            controller: nameController,
            labelText: 'Enter your name',
          ),
          const SizedBox(height: 8),
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
          const SizedBox(height: 8),
          Row(
            children: [
              Checkbox(
                activeColor: AppColors.primary,
                value: _hasAcceptedTerms,
                onChanged: (isChecked) {
                  setState(() {
                    _hasAcceptedTerms = isChecked ?? false;
                  });
                },
              ),
              const Expanded(
                child: Text(
                  'I agree with the terms & conditions and privacy policy',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _hasAcceptedTerms
                ? () async {
                    try {
                      await ref.read(authStateProvider.notifier).createAccount(
                            email: emailController.text,
                            password: passwordController.text,
                            fullName: nameController.text,
                          );
                    } on AuthException catch (e) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.message.toString()),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      });
                    }
                  }
                : null,
            child: const Text('SIGN UP'),
          ),
        ],
      ),
    );
  }
}
