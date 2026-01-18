import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/futuer_provider/future_provider_class.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDate = ref.watch(userDateProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider')),
      body: userDate.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  "${data[index].firstName}  ${data[index].firstName}",
                ),
              );
            },
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
