import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/change_theme/change_theme_provider.dart';
import 'package:riverpod_app/home_page.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) => const ProviderScope(child: MyApp())),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(changeThemeProvider);
    return MaterialApp(
      title: 'Provider',
      debugShowCheckedModeBanner: false,
      theme: isLightTheme ? ThemeData.light() : ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
