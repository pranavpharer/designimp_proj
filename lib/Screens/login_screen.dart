
import 'package:flutter/material.dart';

import '../Widgets/popupreg.dart';
import '../Widgets/loginanimation.dart';

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
class ImageWidget extends StatelessWidget {
  ImageWidget({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  void _savefom(){
    _formkey.currentState!.validate();
  }
  @override
  Widget build(BuildContext context) {
    // final txtmul = Responsive.textMultiplier;
    return  LayoutBuilder
    (
      builder: (BuildContext context, BoxConstraints constraints) {
       final scnHeight=constraints.maxHeight;
       final scnWidth = constraints.maxWidth;
       return SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.max,
      children: [
       Container(
        // height: double.maxFinite,
        // width: double.maxFinite,
       padding: EdgeInsets.fromLTRB(scnWidth/20,scnHeight/20,scnWidth/20,scnHeight/20),
       child: LogoAnimation(),//Container(),//
       ),
      Form(
        key: _formkey,
        child: Column(
          children: [
         // Text
         const Text(
          'Welcome',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: scnHeight/20),

        const Text(
          'Log into your account and get started!',
          style: TextStyle(
            fontSize: 16,
          ),
        ),

        SizedBox(height: scnHeight/20),

        // Email
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
          validator: (value) {
              if (!isValidEmail(value) ){
               return " Insert valid email";
              }
              return null;
          },
        ),

        SizedBox(height: scnHeight/20),

        // Password
        TextFormField(
          decoration:  const InputDecoration(
            labelText: 'Password',
          ),
          validator: (value) {
              if(value!.isEmpty|| value.length<=8){
                return "Enter valid password";
              }
              return null;
          },
        ),

        SizedBox(height: scnHeight/20),

        // Forgot Password
        TextButton(
          onPressed: () {},
          child:  const Text( 
            'Forgot Password?',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),

        SizedBox(height: scnHeight/20),

        // Login Button
        ElevatedButton(
          onPressed:_savefom,
          child: const Text('LOG IN'),
        ),

        SizedBox(height: scnHeight/20),

        // Sign Up Button
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const RegistrationPopup();
               },
            );
          },
          child: const  Text(
            'Don\'t have an account? Sign Up',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],)
      )
       
      ],
    ),
       );
       }
    );
}
}