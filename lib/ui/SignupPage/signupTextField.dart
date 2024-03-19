import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signupTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final GlobalKey<FormState> formKey;

  const signupTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,  required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon? prefixIcon;
    switch (hintText) {
      case 'Email':
        prefixIcon = Icon(Icons.email, color: Colors.grey[500]);
        break;
      case 'Password':
        prefixIcon = Icon(Icons.lock, color: Colors.grey[500]);
        break;
      case 'Phone Number':
        prefixIcon = Icon(Icons.phone, color: Colors.grey[500]);
        break;
      case 'Full Name':
        prefixIcon = Icon(Icons.person, color: Colors.grey[500]);
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 52.0,
        width: double.infinity,
        child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
              prefixIcon: prefixIcon,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value';
              }
              if (hintText == 'Email') {
                // Regular expression for validating email
                // You can adjust this pattern as per your requirements
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
              }
              return null;
            }
        ),
      ),
    );
  }
}