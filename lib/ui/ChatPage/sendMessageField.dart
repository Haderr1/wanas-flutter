import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sendMessageField extends StatelessWidget {
  sendMessageField({super.key});
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.transparent),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Type here..',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff00966A), width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff00966A), width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 15.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.mic_rounded, color: Color(0xFFE0F8E9)),
                  onPressed: () {
                    // Handle microphone icon press
                  },
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border.all(color: Color(0xff00966A), width: 2.0),
            ),
            child: IconButton(
              icon: Icon(Icons.send_rounded, color: Color(0xff00966A)),
              onPressed: () {
                // Handle send icon press
              },
            ),
          ),
        ],
      ),
    );
  }
}
