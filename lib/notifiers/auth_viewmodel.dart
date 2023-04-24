import 'dart:async';

import 'package:auth_route_test/notifiers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';

class AuthViewmodel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  Future<Either<void, String>> login(String email, String password) async {
    final auth = ref.read(firebaseAuthProvider);
    auth.signInWithEmailAndPassword(email: email, password: password);
    return left(() {});
  }
}
