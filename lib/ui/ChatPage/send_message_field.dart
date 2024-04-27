import 'package:flutter/material.dart';
import 'chat_screen.dart';

class SendMessageField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SendMessageField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.transparent),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Type here..',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff00966A), width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xff00966A), width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic_rounded, color: Color(0xff00966A)),
                  onPressed: () {
                    // Handle microphone icon press
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: const Color(0xff00966A), width: 2.0),
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded, color: Color(0xff00966A)),
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  ChatScreen.of(context).sendUserMessage(_controller.text);
                  _controller.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}