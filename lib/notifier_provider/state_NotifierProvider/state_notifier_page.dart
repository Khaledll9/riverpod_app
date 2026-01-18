import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/notifier_provider/state_NotifierProvider/state_notifier_class.dart';

class NotifierProviderPage extends ConsumerWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Notifier Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter', style: Theme.of(context).textTheme.headlineLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: ref
                      .read(counterNotifierProvider.notifier)
                      .increment,
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: ref
                      .read(counterNotifierProvider.notifier)
                      .decrement,
                  icon: const Icon(Icons.minimize_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
