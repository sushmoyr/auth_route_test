import 'package:auth_route_test/ui/ui.dart';
import 'package:routemaster/routemaster.dart';

final publicRoutes = RouteMap(
  routes: {
    '/auth': (_) => const TransitionPage(
          child: LoginScreen(),
        ),
    '/': (_) => const TransitionPage(
          child: WelcomeScreen(),
        ),
    '/auth/verify': (_) => const TransitionPage(
          child: VerifyScreen(),
        ),
  },
);
final privateRoutes = RouteMap(
  routes: {
    '/': (_) => const TransitionPage(
          child: DashboardScreen(),
        ),
    '/about': (_) => const TransitionPage(
          child: AboutScreen(),
        ),
    '/user': (_) => const TransitionPage(
          child: UserScreen(),
        ),
  },
);
