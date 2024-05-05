import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/login_screen.dart';

import '../Buttons/primary_button.dart';

class SuccessfulPage extends StatelessWidget {
  const SuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sucsses.png',
                width: 330.0,
                height: 330.0,
              ),
              const Text(
                'Successful!',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Congratulations, you have changed your password successfully!',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20.0),
              PrimaryButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                buttonText: "Back to login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
