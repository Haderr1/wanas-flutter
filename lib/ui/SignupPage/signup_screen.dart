import 'package:flutter/material.dart';
import 'package:waanaass/ui/Buttons/primary_button.dart';
import 'package:waanaass/ui/LoginPage/login_screen.dart';
import 'package:waanaass/ui/SignupPage/signup_text_field.dart';
import '../Api/register_api.dart';
import '../LoginPage/social_media_card.dart';
import '../TalkToMePage/talk_to_me_screen.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = 'signup';

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Future<void> signUserUp() async {
      if (formKey.currentState!.validate()) {
        String token = await signUpApi(fullNameController.text, emailController.text,
            phoneNumberController.text, passwordController.text);
        if(token !=""){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TalkToMeScreen()),
          );
        }

      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(                alignment: Alignment.topCenter,
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
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
                SignupTextField(
                  controller: fullNameController,
                  hintText: 'Full Name',
                  obscureText: false,
                  formKey: formKey,
                ),
                const SizedBox(height: 10),
                SignupTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  formKey: formKey,
                ),
                const SizedBox(height: 10),
                SignupTextField(
                  controller: phoneNumberController,
                  hintText: 'Phone Number',
                  obscureText: false,
                  formKey: formKey,
                ),
                const SizedBox(height: 10),
                SignupTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: false,
                  formKey: formKey,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                    onTap: () {
                      signUserUp();
                    },
                    buttonText: "Sign Up"),
                const SizedBox(height: 10),
                const SizedBox(height: 15),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an Account?',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
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
      ),
    );
  }
}



