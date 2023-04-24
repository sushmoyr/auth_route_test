import 'dart:async';

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

// class AuthNotifierSync extends Notifier<User?> {
//   @override
//   User? build() {
//     return ref.watch(authNotifierProvider).map(
//           data: (user) => user.value,
//           error: (e) => null,
//           loading: (_) => ref.read(firebaseAuthProvider).currentUser,
//         );
//   }
// }
