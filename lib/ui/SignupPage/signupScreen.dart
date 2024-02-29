import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/loginScreen.dart';
import 'package:waanaass/ui/SignupPage/signupButton.dart';
import 'package:waanaass/ui/SignupPage/signupServer.dart';
import 'package:waanaass/ui/SignupPage/signupTextField.dart';

import '../LoginPage/socialMediaCard.dart';

class signupScreen extends StatefulWidget {
  static const String routeName = 'signup';

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SignupFunction SignUp = SignupFunction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  widthFactor: 0.4, // Adjust the width as needed
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              signupTextField(
                controller: fullNameController,
                hintText: 'Full Name',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              signupTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              signupTextField(
                controller: phoneNumberController,
                hintText: 'Phone Number',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              signupTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),

              const SizedBox(height: 20),

              SignupButton(onTap: SignUp.signUp, ButtonText: "Sign Up"),
              SizedBox(height: 10),

              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  socialMediaCard(imagePath: 'assets/images/Google.png'),
                  SizedBox(width: 25),
                  // apple button
                  socialMediaCard(imagePath: 'assets/images/Vector.png'),
                  SizedBox(width: 25),
                  // apple button
                  socialMediaCard(imagePath: 'assets/images/Facebook.png'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an Account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginScreen()),
                      );
                    },
                    child: Text(
                      'Login in',
                      style: TextStyle(
                        color: Color(0xFF00966A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
