import 'package:flutter/material.dart';
import 'package:waanaass/ui/ForgotPass/sucssesful.dart';
import '../Buttons/primary_button.dart';

class NewPasswordPage extends StatefulWidget {
  final String title;

  const NewPasswordPage({Key? key, required this.title, required List<String> otpCodes}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _newPasswordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

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
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/newpass.png',
                  width: 221.0,
                  height: 221.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'New Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: _newPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // Hide the entered password
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: _retypePasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Re-type Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 40.0),
                PrimaryButton(
                  onTap: () {
                    String newPassword = _newPasswordController.text;
                    String retypedPassword = _retypePasswordController.text;

                    if (newPassword != retypedPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Passwords DO NOT MATCH!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessfulPage(),
                      ),
                    );
                  },
                  buttonText: "Confirm Password",
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}