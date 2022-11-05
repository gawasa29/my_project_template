import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/pllete.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  void toggleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('profile'),
              ElevatedButton(
                child: const Text('モード切り替え'),
                onPressed: () {
                  toggleTheme(ref);
                },
              ),
            ],
          ),
        ));
  }
}
