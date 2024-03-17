import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/loginScreen.dart';
import 'package:waanaass/ui/TalkToMePage/talkToMeScreen.dart';
import '../Api/Api.dart';
import '../Storage/storage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
    static const String routeName = 'auth';


  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    try {
      TokenStorage tokenStorage = TokenStorage();
      token = await tokenStorage.getToken();
      authenttoken();
    } catch (e) {
      rethrow;
    }
    setState(() {
      const Text("loading authenticating");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (token != null) {
      return talkToMeScreen();
    } else {
      return loginScreen();
    }
  }
}

/*class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String? token;
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    setState(() {
      isLoading = true;
    });
    token = await tokenStorage.getToken();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (token != null) {
      return talkToMeScreen();
    } else {
      return loginScreen();
    }
  }
}*/

// class authPage extends StatelessWidget {
//   const authPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     //    String? token = await tokenStorage.getToken();
//
//     if(true){
//       return talkToMeScreen();
//     }else{
//       return loginScreen();
//     }
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:waanaass/ui/LoginPage/loginScreen.dart';
// import 'package:waanaass/ui/TalkToMePage/talkToMeScreen.dart';
//
// import '../Storage/storage.dart';
//
//
// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);
//   static const String routeName = 'auth';
//
//   @override
//   _AuthPageState createState() => _AuthPageState();
// }
//
// class _AuthPageState extends State<AuthPage> {
//
//   String? token;
//
//   @override
//   void initState() {
//     super.initState();
//     getToken();
//   }
//
//   Future<void> getToken() async {
//     TokenStorage tokenStorage = TokenStorage();
//     token = await tokenStorage.getToken();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (token != null) {
//       return talkToMeScreen();
//     } else {
//       return loginScreen();
//     }
//   }
// }
//
//
//
//
// /*class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);
//
//   @override
//   _AuthPageState createState() => _AuthPageState();
// }
//
// class _AuthPageState extends State<AuthPage> {
//   String? token;
//   bool isLoading = true;
//
//
//   @override
//   void initState() {
//     super.initState();
//     getToken();
//   }
//
//   Future<void> getToken() async {
//     setState(() {
//       isLoading = true;
//     });
//     TokenStorage tokenStorage = TokenStorage();
//     token = await tokenStorage.getToken();
//     setState(() {
//       isLoading = false;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (token != null) {
//       return talkToMeScreen();
//     } else {
//       return loginScreen();
//     }
//   }
// }*/
//
//
//
//
//
// // class authPage extends StatelessWidget {
// //   const authPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     //TokenStorage tokenStorage= TokenStorage();
// //
// //     //    String? token = await tokenStorage.getToken();
// //
// //     if(true){
// //       return talkToMeScreen();
// //     }else{
// //       return loginScreen();
// //     }
// //   }
// // }
