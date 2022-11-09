import 'package:flutter/material.dart';

import 'chat/screens/mobile_chat_screen.dart';

class TestScreen1 extends StatelessWidget {
  const TestScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('test1'),
              ElevatedButton(
                child: const Text('Button'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MobileChatScreen(
                              name: "gasafd",
                              //ここに相手のuid入れる
                              uid: "yUkwpotBuFW0kNhS4BZJA83xsbc2",
                            )),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
