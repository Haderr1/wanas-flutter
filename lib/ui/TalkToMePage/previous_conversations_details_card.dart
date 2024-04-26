import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousConversationsDetailsCard extends StatelessWidget {
  String namedata;
  String timedata;
  String datedata;

  PreviousConversationsDetailsCard(
      {required this.namedata,
      required this.timedata,
      required this.datedata,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF00966A),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF00966A),
                  fontSize: 14,
                  fontWeight: FontWeight
                      .w500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(namedata,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          Column(
            children: [
              const Text(
                'Time',
                style: TextStyle(
                  color: Color(0xFF00966A),
                  fontSize: 14,
                  fontWeight: FontWeight
                      .w500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(timedata,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          Column(
            children: [
              const Text(
                'Date',
                style: TextStyle(
                  color: Color(0xFF00966A),
                  fontSize: 14,
                  fontWeight: FontWeight
                      .w500,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(datedata,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
