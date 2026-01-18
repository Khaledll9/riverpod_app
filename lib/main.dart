import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/change_theme/change_theme_page.dart';
import 'package:riverpod_app/change_theme/change_theme_provider.dart';
import 'package:riverpod_app/futuer_provider/future_provider_page.dart';
import 'package:riverpod_app/notifier_provider/state_NotifierProvider/state_notifier_page.dart';
import 'package:riverpod_app/state_NotifierProvider/state_notifier_page.dart';
import 'package:riverpod_app/stream_provider/stream_provider_page.dart';

import 'provider_setProvider/pages/auto_dispose/auto_dispose_page.dart';
import 'provider_setProvider/pages/basic/basic_page.dart';
import 'provider_setProvider/widgets/custom_button.dart';

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
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Provider')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: const [
            CustomButton(title: 'Provider', child: BasicPage()),
            CustomButton(title: 'State Notifier 1', child: AutoDisposePage()),

            CustomButton(title: 'State Notifier 2', child: StateNotifierPage()),
            CustomButton(title: 'Future Provider', child: FutureProviderPage()),
            CustomButton(title: 'Stream Provider', child: StreamProviderPage()),
            CustomButton(title: 'Change Theme', child: ChangeThemePage()),
            CustomButton(
              title: 'Notifier Provider',
              child: NotifierProviderPage(),
            ),
          ],
        ),
      ),
    );
  }
}
