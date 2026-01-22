import 'package:flutter/material.dart';
import 'package:riverpod_app/provider_setProvider/widgets/custom_button.dart';

import 'basic/basic_page.dart';
import 'change_theme/change_theme_page.dart';
import 'futuer_provider/pages/user/future_provider_page.dart';
import 'notifier_provider/state_NotifierProvider/state_notifier_page.dart';
import 'provider_setProvider/pages/auto_dispose/auto_dispose_page.dart';
import 'provider_setProvider/pages/basic/basic_page.dart';
import 'provider_setProvider/pages/family/family_page.dart';
import 'state_NotifierProvider/state_notifier_page.dart';
import 'stream_provider/stream_provider_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Provider')),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: const [
            CustomButton(title: 'basic', child: BasicPageRiverpod()),
            CustomButton(title: 'Provider', child: BasicPage()),
            CustomButton(title: 'State Provider', child: AutoDisposePage()),
            CustomButton(title: 'Family Provider', child: FamilyPage()),
            CustomButton(title: 'State Notifier', child: StateNotifierPage()),
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
