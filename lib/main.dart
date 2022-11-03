import 'package:flutter/material.dart';
import 'package:my_project_template/features/auth/screens/login_screen.dart';

import 'theme/pllete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Pallete.lightModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
