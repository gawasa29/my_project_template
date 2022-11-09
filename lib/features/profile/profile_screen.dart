import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project_template/common/widgets/loader.dart';
import 'package:my_project_template/features/auth/controller/auth_controller.dart';

import '../../theme/pllete.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  void toggleTheme(WidgetRef ref) {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //FutureProviderは`.when` を使ってハンドリングする
    return ref.watch(userDataAuthProvider).when(
        // 非同期処理が完了すると、取得した データが使用できる
        data: (user) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  children: <Widget>[
                    Text('profile'),
                    Text(user!.name),
                    ElevatedButton(
                      child: const Text('モード切り替え'),
                      onPressed: () {
                        toggleTheme(ref);
                      },
                    ),
                  ],
                ),
              ));
        },
        // エラーが発生した場合に表示されるWidgetを指定
        error: ((error, stackTrace) => Text('Error: $error')),
        // 非同期処理中は `loading` で指定したWidgetが表示される
        loading: () => const Loader());
  }
}
