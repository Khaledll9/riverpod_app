import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

final counterProvider = StateProvider<int>((ref) {
  ref.onDispose(() => print("counter Provider Dispose"));
  return 0;
});

final ageProvider = Provider<String>((ref) {
  final age = ref.watch(counterProvider);
  return "I'm $age years old";
});

@Riverpod(keepAlive: true)
String old(OldRef ref) {
  final old = ref.watch(counterProvider);
  return "You are $old years old?";
}
