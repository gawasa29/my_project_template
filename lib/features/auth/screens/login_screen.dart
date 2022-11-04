import 'package:flutter/material.dart';
import 'package:my_project_template/common/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enter your phone number'),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('this project will need to verify your phone number.'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'phone number',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 90,
                child: CustomButton(
                  onPressed: () {},
                  text: 'Next',
                ),
              )
            ],
          ),
        ));
  }
}
