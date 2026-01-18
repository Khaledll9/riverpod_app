import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeCounterProvider = StateProvider.autoDispose<int>((ref) {
  ref.onDispose(() => print("counter Provider Dispose"));
  return 0;
});

final autoDisposeAgeProvider = Provider<String>((ref) {
  final age = ref.watch(autoDisposeCounterProvider);
  return "I'm $age years old";
});

// @Riverpod(keepAlive: true)
// String old(OldRef ref) {
//   final old = ref.watch(counterProvider);
//   return "You are $old years old?";
// }
