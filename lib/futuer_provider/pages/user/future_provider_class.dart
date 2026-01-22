import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/futuer_provider/provider/user_provider.dart'
    show dioProvider;

import '../../models/user.dart';

final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
  ref.onDispose(() {
    print('[userListProvider] disposed');
  });
  final response = await ref.watch(dioProvider).get('/?results=10');
  // throw 'Fail to fetch user list';
  final List userList = response.data['results'];
  final users = [for (final user in userList) User.fromJson(user)];
  return users;
});
