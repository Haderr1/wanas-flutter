import 'package:flutter/material.dart';

class AddPersonaButton extends StatelessWidget {

  Function()? onTap;
   AddPersonaButton({super.key,  required this.onTap, });


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
              color: const Color(0xFF00966A),

            ),
            child:const Icon(Icons.add, color: Colors.white, size: 24) ,
          ),
        ],
      ),
    );
  }
}
