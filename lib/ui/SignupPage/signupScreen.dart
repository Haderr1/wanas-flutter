import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/loginScreen.dart';
import 'package:waanaass/ui/SignupPage/signupButton.dart';
import 'package:waanaass/ui/SignupPage/signupTextField.dart';
import '../LoginPage/socialMediaCard.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = 'signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    final String username = fullNameController.text;
    final String email = emailController.text;
    final String phoneNumber = phoneNumberController.text;
    final String password = passwordController.text;

    var url = Uri.http('192.168.1.5:3000', '/account');
    var response = await http.post(
      url,
      body: jsonEncode({
        'PhoneNumber': phoneNumber,
        'username': username,
        'email': email,
        'password': password,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      // Successfully signed up
      print('Signed up successfully');
    } else {
      // Handle error
      print('Error signing up: ${response.reasonPhrase}');
    }
  }

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
              // logo at the top
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
              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),
              // name textfield
              Stext(
                controller: fullNameController,
                hintText: 'Full Name',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              // email textfield
              Stext(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              Stext(
                controller: phoneNumberController,
                hintText: 'Phone Number',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              Stext(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),

              const SizedBox(height: 20),

              SignUpButton(onTap: signUp, ButtonText: "Sign Up"),
              SizedBox(height: 10),

              SizedBox(height: 15),
              // sign in button

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
              // google + apple +  facebook sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // google button
                  SocialMediaCard(imagePath: 'assets/images/Google.png'),
                  SizedBox(width: 25),
                  // apple button
                  SocialMediaCard(imagePath: 'assets/images/Vector.png'),
                  SizedBox(width: 25),
                  // apple button
                  SocialMediaCard(imagePath: 'assets/images/Facebook.png'),
                ],
              ),
              const SizedBox(height: 20),
              // not a member? register now text
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
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
