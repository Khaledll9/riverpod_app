import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/basic/basic_provider.dart';

class BasicPageRiverpod extends ConsumerWidget {
  const BasicPageRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hello = ref.watch(helloProvider(there: "khaled"));

    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider')),
      body: Center(
        child: Text(hello, style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
