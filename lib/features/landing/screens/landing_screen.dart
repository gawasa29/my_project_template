import 'package:flutter/material.dart';
import 'package:my_project_template/common/widgets/custom_button.dart';

import '../../auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'My Project Template',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomButton(
              text: 'AGREE AND CONTINUE',
              onPressed: () => navigateToLoginScreen(context),
            ),
          ],
        ),
      ),
    );
  }
}
