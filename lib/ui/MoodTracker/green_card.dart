import 'package:flutter/material.dart';
import '../Api/quote_api.dart';
import '../Buttons/small_button.dart';

class GreenCard extends StatefulWidget {
  const GreenCard({super.key});

  @override
  GreenCardState createState() => GreenCardState();
}

class GreenCardState extends State<GreenCard> {
  bool cardVisible = true;
  String specificText = '';
  String quote = '';

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
                borderRadius: BorderRadius.circular(14),
                color: Colors.white.withOpacity(0.7),
              ),
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
                  const Text(
                    'Click on the card, and be ready for the surprise the card holds just for you!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10.0),
                  Center(
                    child: SmallButton(
                      onPressed: () {
                        generateQuoteAndHandleImageClick();
                      },
                      buttonText: 'Click',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !cardVisible,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF66C0A6),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white.withOpacity(0.7),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  specificText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleImageClick({String? message}) {
    setState(() {
      cardVisible = false;
      specificText = message ?? '';
    });
  }

  Future<void> generateQuoteAndHandleImageClick() async {
    String quote = await QuoteUtility.getRandomQuote();
    handleImageClick(message: quote);
  }
}

class ClickableImage extends StatelessWidget {
  final String imagePath;
  final String grayText;
  final VoidCallback onTap;

  const ClickableImage(this.imagePath, this.grayText,
      {required this.onTap, Key? key})
      : super(key: key);

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
