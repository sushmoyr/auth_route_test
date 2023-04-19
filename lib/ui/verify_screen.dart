import 'package:auth_route_test/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class VerifyScreen extends ConsumerWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify"),
      ),
      body: Center(
        child: state.maybeWhen(
          orElse: () => const CircularProgressIndicator(),
          data: (d) => ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 360,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Pin',
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      ref
                          .read(authNotifierProvider.notifier)
                          .login()
                          .then((value) {
                        // Routemaster.of(context).push('/');
                      });
                    },
                    child: Text('Verify'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
