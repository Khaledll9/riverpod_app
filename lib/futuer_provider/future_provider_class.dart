import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/futuer_provider/models/user.dart';
import 'package:riverpod_app/futuer_provider/services/api.dart';

final apiProvider = Provider<Api>((ref) => Api());

final userDateProvider = FutureProvider<List<User>>((ref) {
  return ref.read(apiProvider).getUser();
});
