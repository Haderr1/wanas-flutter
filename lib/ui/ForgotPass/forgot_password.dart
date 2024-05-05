import 'package:flutter/material.dart';

import '../Buttons/primary_button.dart';
import 'conformation.dart';

class PasswordResetPage extends StatefulWidget {
  final String title;

  const PasswordResetPage({Key? key, required this.title}) : super(key: key);

  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16,left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Resetpassword.png',
                  width: 221.0,
                  height: 221.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'please enter your email or phone number to receive '
                      'a confirmation code to reset '
                      'your password',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(height: 40.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00966A),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: PrimaryButton(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmationPage(key: GlobalKey()),
                        ),
                      );
                    },
                    buttonText: "Confirmation code",
                  ),
                ),
                const SizedBox(height: 30.0),
                TextButton(
                  onPressed: () {
                    // Implement logic to go back to sign-in page
                  },
                  child: const Text(
                    'Back to sign in',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}