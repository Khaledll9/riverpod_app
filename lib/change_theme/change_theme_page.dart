import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/change_theme/change_theme_provider.dart';

class ChangeThemePage extends ConsumerWidget {
  const ChangeThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(changeThemeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Change Theme')),
      body: Center(
        child: Switch(
          value: isLightTheme,
          onChanged: (value) {
            ref.read(changeThemeProvider.notifier).state = value;
          },
        ),
      ),
    );
  }
}
