
import 'package:flutter/material.dart';
import 'package:waanaass/ui/signupcomponents/s_button.dart';
import 'package:waanaass/ui/signupcomponents/s_text.dart';
import 'components/square_title.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static const String routeName = 'signup';


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
                controller: nameController,
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

              // phone number textfield
              Stext(
                controller: phoneController,
                hintText: 'Phone Number',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              // password textfield
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

              //  start signup button
              Sbutton(
                onTap: signUserIn,
              ),
              // ... (your existing code)
              const SizedBox(height: 10),
              // password textfield
              // ... (your existing code)
              const SizedBox(height: 15),
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
                  SquareTile(imagePath: 'assets/images/Google.png'),
                  SizedBox(width: 25),
                  // apple button
                  SquareTile(imagePath: 'assets/images/Vector.png'),
                  SizedBox(width: 25),
                  // apple button
                  SquareTile(imagePath: 'assets/images/Facebook.png'),
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
                    onTap: () => navigateToSignUpPage(context),
                    child: Text(
                      'Sign in',
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

  // Define the signUserIn function here
  void signUserIn() {
    // Implement your sign-in logic here
  }

  // Define the navigateToSignUpPage function here
  navigateToSignUpPage(BuildContext context) {
    // Implement your navigation logic here
  }
}