import 'package:flutter/material.dart';

class TestScreen2 extends StatelessWidget {
  const TestScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: const <Widget>[Text('test2')],
          ),
        ));
  }
}
