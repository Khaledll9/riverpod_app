import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider.autoDispose<int>((ref) {
  return Stream.periodic(
    Duration(seconds: 2),

    (computationCount) => computationCount,
  );
});
