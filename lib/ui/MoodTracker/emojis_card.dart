import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmojisCard extends StatefulWidget {
  const EmojisCard({super.key});

  @override
  EmojisCardState createState() => EmojisCardState();
}

class EmojisCardState extends State<EmojisCard> {
  bool cardVisible = true;
  String specificText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Visibility(
            visible: cardVisible,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF66C0A6),
                    width: 1.0,

                  ),
                  borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'How are you feeling Today?',
                        style: TextStyle(
                          color: Color(0xFF66C0A6),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClickableImage('assets/images/normal.png', 'normal', () {
                        handleImageClick(
                            'Glad to know things are going smoothly.');
                      }),
                      ClickableImage('assets/images/happy.png', 'happy', () {
                        handleImageClick(
                            'Im thrilled to hear that youre feeling happy! Your positive energy is contagious.');
                      }),
                      ClickableImage('assets/images/sad.png', 'sad', () {
                        handleImageClick(
                            'Im sorry to hear that youre feeling down. If you want to talk or if theres anything I can do to help, Im here for you.');
                      }),
                      ClickableImage('assets/images/tense.png', 'tense', () {
                        handleImageClick(
                            'It seems like things are a bit tense right now. If theres anything on your mind or if you need a moment, Im here to listen and support you.');
                      }),
                      ClickableImage('assets/images/angry.png', 'angry', () {
                        handleImageClick(
                            'I understand that youre feeling upset. If youre comfortable, we can talk about what happened, and Im here to support you.');
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !cardVisible,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF66C0A6),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14)),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                specificText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleImageClick(String message) {
    setState(() {
      cardVisible = false;
      specificText = message;
      if (kDebugMode) {
        print(message);
      }
    });
  }
}

class ClickableImage extends StatelessWidget {
  final String imagePath;
  final String grayText;
  final VoidCallback onTap;

  const ClickableImage(this.imagePath, this.grayText, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(imagePath, width: 50.0, height: 50.0),
          const SizedBox(height: 5.0),
          Text(
            grayText,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
