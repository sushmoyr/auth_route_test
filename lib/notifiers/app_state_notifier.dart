import 'dart:async';

import 'package:auth_route_test/states/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateNotifierProvider =
    NotifierProvider<AppStateNotifier, AppState>(() => AppStateNotifier());

class AppStateNotifier extends Notifier<AppState> {
  @override
  AppState build() {
    final state = ref.watch(authStateChangesNotifier).maybeWhen<AppState>(
          orElse: () => const AppState.loading(),
          data: (d) => d != null ? const Authenticated() : const Guest(),
        );

    return state;
  }
}

class User {
  final String name;

  User(this.name);
}

Future<void> delay(int ms) => Future.delayed(Duration(milliseconds: ms));

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authStateChangesNotifier = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).streamController.stream;
});

class AuthRepository {
  final StreamController<User?> streamController = StreamController();

  Future<void> login() async {
    await delay(5000);
    streamController.add(User('John Doe'));
  }

  void logout() async {
    delay(1000);
    streamController.add(null);
  }
}
