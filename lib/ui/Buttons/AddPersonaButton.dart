import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPersonaButton extends StatelessWidget {

  Function()? onTap;
   AddPersonaButton({ required this.onTap, });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,

      child: Column(
        children: [
          Container(
            width: 74,
            height: 79,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(8),
              color: Color(0xFF00966A),

            ),
            child:Icon(Icons.add, color: Colors.white, size: 24) ,
          ),
        ],
      ),
    );
  }
}
