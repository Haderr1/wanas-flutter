import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:waanaass/ui/signupcomponents/s_button.dart';
import 'package:waanaass/ui/signupcomponents/s_text.dart';
import 'components/square_title.dart';
import 'loginpage.dart';

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
    final String id = "1";
    final String time = "444";

    var url = Uri.http('192.168.1.10:3000','/register');
    var response = await http.post(url,
        body:
        jsonEncode ({
        'PhoneNumber': phoneNumber,
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Successfully signed up
      print('Signed up successfully');
    } else {
      // Handle error
      print('Error signing up: ${response.reasonPhrase}');
    }
  }
  // final _formKey = GlobalKey<FormState>();
  // TextEditingController _usernameController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _phoneController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
  // Future<void> register() async {
  //   if (_formKey.currentState != null) {
  //     String username = _usernameController.text;
  //     String email = _emailController.text;
  //     String phone = _phoneController.text;
  //     String password = _passwordController.text;
  //
  //     try {
  //       // Send data to the server
  //       var response = await http.post(
  //         Uri.parse('http://192.168.1.5:56419/register'),
  //         body: {
  //           'username': username,
  //           'email': email,
  //           'phone': phone,
  //           'password': password,
  //         },
  //       );
  //
  //       if (response.statusCode == 200) {
  //         print('Registration successful!');
  //         // Handle success, maybe navigate to another screen
  //       } else {
  //         print('Registration failed: ${response.statusCode}');
  //         // Handle failure, maybe show an error message
  //       }
  //     } catch (e) {
  //       print('Error registering: $e');
  //       // Handle error
  //     }
  //   }
  // }
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

              // phone number textfield
              Stext(
                controller: phoneNumberController,
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green, // Set button color to green
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: signUp,
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

              // Sbutton(
              //   onTap: signUp,
              //   // onTap: () async {
              //   //   bool isAuthenticated = await authenticateUser();
              //   //   if (isAuthenticated) {
              //   //     MaterialPageRoute(builder: (context) => LoginPage());
              //   //   } else {
              //   //     print("error");
              //   //   }
              //   // },
              // ),
              // // ... (your existing code)
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

  // Define the signUserIn function he
  navigateToSignUpPage(BuildContext context) {
    // Implement your navigation logic here
  }
}
//
// Future<bool> authenticateUser() async {
//   var userData = {
//     "Username": "JohnDoe",
//     "Email": "john@example.com",
//     "PhoneNumber": "1234567890",
//     "Password": "password123"
//   };
//
//   var url = Uri.parse('http://192.168.1.5:56419/userdata');
//   var response = await http.post(
//     url,
//     headers: {"Content-Type": "application/json"},
//     body: json.encode(userData),
//   );
//
//   if (response.statusCode == 200) {
//     print('Data sent successfully');
//     // Assuming your server returns a JSON indicating authentication success or failure
//     Map<String, dynamic> data = json.decode(response.body);
//     return data['authenticated'] == true;
//   } else {
//     print('Failed to send data. Error: ${response.reasonPhrase}');
//     return false;
//   }
// }
