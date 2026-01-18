import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/stream_provider/stream_provider_class.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDate = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Provider')),
      body: userDate.when(
        data: (data) {
          return Center(
            child: Text(
              data.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          );
        },
        error: (error, stackTrace) {
          return Text(error.toString(), textAlign: TextAlign.center);
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
