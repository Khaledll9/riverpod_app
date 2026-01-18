import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/state_NotifierProvider/state_notifier_class.dart';

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider')),
      body: Center(
        child: Text('$value', style: Theme.of(context).textTheme.headlineLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
