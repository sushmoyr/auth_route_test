import 'package:auth_route_test/notifiers/app_state_notifier.dart';
import 'package:auth_route_test/route.dart';
import 'package:auth_route_test/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateNotifierProvider);
    RouteMap routeMap;

    if (appState is Guest) {
      routeMap = publicRoutes;
    } else if (appState is Authenticated) {
      routeMap = privateRoutes;
    } else {
      routeMap = publicRoutes;
    }

    RoutemasterDelegate routerDelegate = RoutemasterDelegate(
      routesBuilder: (context) => routeMap,
      navigatorKey: navigatorKey,
    );

    // routerDelegate.push('/');

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: routerDelegate,
    );
  }
}
