import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController  controller;
  final String hintText;
  final bool obscureText;
  final GlobalKey<FormState> formKey;


  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.formKey,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9.0),
                borderSide:
                const BorderSide(color: Colors.red),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
              prefixIcon: hintText == 'Email'
                  ? Icon(Icons.email, color: Colors.grey[500])
                  : Icon(Icons.lock, color: Colors.grey[500]),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a value';
              }
              if (hintText == 'Email') {
                // Regular expression for validating email
                // You can adjust this pattern as per your requirements
                final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
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
