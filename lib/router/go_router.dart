import 'package:auth_route_test/notifiers/auth_notifier.dart';
import 'package:auth_route_test/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authNotifierProvider);
  print(auth);
  return GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/auth',
          name: 'Login',
          builder: (ctx, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/about',
          name: 'About',
          builder: (ctx, state) => AboutScreen(),
        ),
        GoRoute(
          path: '/',
          name: 'Dashboard',
          builder: (ctx, state) => DashboardScreen(),
        ),
        GoRoute(
          path: '/user',
          name: 'User',
          builder: (ctx, state) => UserScreen(),
        ),
        GoRoute(
          path: '/auth/verify',
          name: 'Verify',
          builder: (ctx, state) => VerifyScreen(),
        ),
        GoRoute(
          path: '/welcome',
          name: 'Welcome',
          builder: (ctx, state) => WelcomeScreen(),
        ),
      ],
      redirect: (context, state) {
        if (auth.isLoading || auth.hasError) return null;

        final bool isAuthenticated = auth.valueOrNull != null;

        bool isInAuthRoute = state.location == '/auth' ||
            state.location == '/auth/verify' ||
            state.location == '/welcome';

        print('Is in auth: $isInAuthRoute, auth: $isAuthenticated');

        if (isInAuthRoute && isAuthenticated) {
          return '/';
        }

        if (!isInAuthRoute && !isAuthenticated) {
          return '/welcome';
        }

        return null;
      });
});
