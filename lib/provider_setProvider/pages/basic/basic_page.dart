import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/provider_setProvider/pages/basic/basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen<int>(counterProvider, (previous, next) {
    //   if (next == 3) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         content: Text(
    //           "Counter: 3",
    //           style: Theme.of(context).textTheme.bodyLarge,
    //           textAlign: TextAlign.center,
    //         ),
    //       ),
    //     );
    //   }
    // });

    final value = ref.watch(oldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider')),
      body: Center(
        child: Text(value, style: Theme.of(context).textTheme.headlineLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
