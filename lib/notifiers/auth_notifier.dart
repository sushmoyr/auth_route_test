import 'dart:async';

import 'package:auth_route_test/notifiers/app_state_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    StreamNotifierProvider<AuthNotifier, User?>(() => AuthNotifier());

final firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

class AuthNotifier extends StreamNotifier<User?> {
  @override
  Stream<User?> build() {
    return ref.watch(firebaseAuthProvider).authStateChanges();
  }
}
