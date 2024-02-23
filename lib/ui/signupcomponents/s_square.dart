
import 'package:flutter/material.dart';
import 'package:waanaass/ui/signupcomponents/s_button.dart';
import 'package:waanaass/ui/signupcomponents/s_text.dart';



class SignUpPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  widthFactor: 0.8, // Adjust the width as needed
                  child: Image.asset(
                    'assets/logo.png',
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
              // username textfield
              Stext(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(height: 10),

              Stext(
                controller: usernameController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              Stext(
                controller: usernameController,
                hintText: 'Email',
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
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              //  start signup button
              Sbutton(
                onTap: signUserIn,
              ),
              // ... (your existing code)
              const SizedBox(height: 10),
              // password textfield
              // ... (your existing code)
              const SizedBox(height: 10),
              // forgot password?
              // ... (your existing code)
              const SizedBox(height: 25),
              // sign in button
              // ... (your existing code)
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
}