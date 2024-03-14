import 'package:flutter/cupertino.dart';
import 'package:waanaass/ui/LoginPage/loginScreen.dart';
import 'package:waanaass/ui/TalkToMePage/talkToMeScreen.dart';

class authPage extends StatelessWidget {
  const authPage({super.key});

  @override
  Widget build(BuildContext context) {
   if(true){
     return talkToMeScreen();
   }else{
     return loginScreen();
   }
  }
}
