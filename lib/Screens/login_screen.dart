
import 'package:designimp_proj/Widgets/image_widget.dart';

import 'package:flutter/material.dart';



 var _emailRegex = RegExp(
  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
);
bool isValidEmail(String? email) {
  return _emailRegex.hasMatch(email!);
}
class LoginScreen extends StatefulWidget{
   LoginScreen({Key? key}) : super(key: key);
  
  @override
  State<LoginScreen> createState() =>  _loginScreenState(); 
  // static const routeName = '/login';
}
class _loginScreenState extends State<LoginScreen>{
ValueNotifier<String?> passwordNotifier = ValueNotifier('');  

@override  
Widget build(BuildContext context){
  
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return   Scaffold(
    
    body: Container(
      height: screenHeight,
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(10,screenHeight/20, 10, screenHeight/20),
      child:ImageWidget(),
    ),
  );
}
}