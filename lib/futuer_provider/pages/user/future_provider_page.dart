import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/futuer_provider/pages/user/future_provider_class.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDate = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('StateProvider')),
      body: userDate.when(
        data: (users) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(user.gender[0].toUpperCase()),
                ),
                title: Text(user.email),
              );
            },
          );
        },
        error: (error, _) {
          return Center(child: Text(error.toString()));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
