import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class previousConversationsDetailsCard extends StatelessWidget {
  String namedata;
  String timedata;
  String datedata;

  previousConversationsDetailsCard(
      {required this.namedata,
      required this.timedata,
      required this.datedata,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF00966A),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF00966A),
                  fontSize: 14,
                  fontWeight: FontWeight
                      .w500, // Set text color for the first row to white
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(namedata,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          Column(
            children: [
              Text(
                'Time',
                style: TextStyle(
                  color: Color(0xFF00966A),
                  fontSize: 14,
                  fontWeight: FontWeight
                      .w500, // Set text color for the first row to white
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(timedata,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          Column(
            children: [
              Text(
                'Date',
                style: TextStyle(
                  color: Color(0xFF00966A),
                  fontSize: 14,
                  fontWeight: FontWeight
                      .w500, // Set text color for the first row to white
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(datedata,
                  style: TextStyle(
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
