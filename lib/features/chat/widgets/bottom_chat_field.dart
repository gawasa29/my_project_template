import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/chat_controller.dart';

class BottomChatScreen extends ConsumerStatefulWidget {
  final String recieverUserId;
  const BottomChatScreen({
    Key? key,
    required this.recieverUserId,
  }) : super(key: key);

  @override
  ConsumerState<BottomChatScreen> createState() => _BottomChatScreenState();
}

class _BottomChatScreenState extends ConsumerState<BottomChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  void sendTextMessage() async {
    ref.read(chatControllerProvider).sendTextMessage(
        context, _messageController.text.trim(), widget.recieverUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              prefixIcon: const SizedBox(
                width: 100,
                child: Icon(
                  Icons.emoji_emotions,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              hintText: 'Type a message!',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 8, right: 2, left: 2),
          child: CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 0, 0),
            radius: 25,
            child: GestureDetector(
              child: Icon(
                Icons.send,
              ),
              onTap: () => sendTextMessage(),
            ),
          ),
        )
      ],
    );
  }
}
