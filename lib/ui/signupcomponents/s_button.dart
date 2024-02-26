import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:waanaass/ui/talktomepage/talktomescreen.dart';

import '../loginpage.dart';

class Sbutton extends StatelessWidget {
  final Function()? onTap;

  const Sbutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color(0xFF00966A),
          borderRadius: BorderRadius.circular(80),
        ),
        child: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
