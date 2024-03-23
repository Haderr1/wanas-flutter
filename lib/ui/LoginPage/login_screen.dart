import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/social_media_card.dart';
import '../Api/login_api.dart';
import '../Buttons/primary_button.dart';
import '../SignupPage/signup_screen.dart';
import 'package:waanaass/ui/LoginPage/login_text_field.dart';

import '../TalkToMePage/talk_to_me_screen.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static const String routeName = 'login';
  final formKey = GlobalKey<FormState>();

  LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    Future<void> signUserIn() async {
    if (formKey.currentState!.validate()) {
      String token = await loginApi(emailController.text , passwordController.text);
      if(token !=""){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const talkToMeScreen()),
        );
      }
    }
  }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  // logo
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  LoginTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    formKey: formKey,
                  ),
                  const SizedBox(height: 10),
                  LoginTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: false,
                    formKey: formKey,
                  ),
                  const SizedBox(height: 10),
                  // forgot password?
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xFF00966A)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  // sign in button
                  PrimaryButton(
                    onTap: () {
                      signUserIn();
                    },
                    buttonText: "Log In",
                  ),
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 30),
                  // google + apple +  facebook sign in buttons
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      const Text(
                        'Don\'t have an Account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
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
        ),
      ),
    );
  }
}


