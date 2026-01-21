import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

@Riverpod(keepAlive: true)
String world(Ref ref) {
  ref.onDispose(() => print("world Provider Dispose"));
  return "World";
}

@riverpod
String hello(Ref ref, {required String there}) {
  ref.onDispose(() => print("hello Provider Dispose"));
  return "Hello $there";
}
