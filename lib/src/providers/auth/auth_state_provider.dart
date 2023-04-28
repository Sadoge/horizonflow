import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horizonflow/src/core/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authStateProvider = StateNotifierProvider<AuthState, User?>((ref) {
  return AuthState();
});

class AuthState extends StateNotifier<User?> {
  AuthState() : super(null) {
    _init();
  }

  Future<void> _init() async {
    state = supabase.auth.currentUser;
  }

  Future<void> signIn(String email, String password) async {
    try {
      final response = await supabase.auth
          .signInWithPassword(email: email, password: password);

      if (response.user != null) {
        state = response.user;
      } else {
        throw Exception('User is null');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
    state = null;
  }
}
