import 'package:designimp_proj/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widgets/popupreg.dart';
import '../Widgets/loginanimation.dart';

class ImageWidget extends StatefulWidget {
  ImageWidget({Key? key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}
class _ImageWidgetState extends State<ImageWidget> {
  final _formkey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  void _signIn() async{
    _formkey.currentState!.validate();
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
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
          controller: _emailController,
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
          controller: _passwordController,
          validator: (value) {
              if(value!.isEmpty|| value.length<=8){
                return "Enter valid password";
              }
              return null;
          },
        ),

        SizedBox(height: scnHeight/20),
        // Login Button
        ElevatedButton(
          onPressed:_signIn,
          child: const Text('LOG IN'),
        ),
        

        SizedBox(height: scnHeight/20),

        
        

        //SizedBox(height: scnHeight/20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
        
        // Sign Up Button
        SizedBox(
          width: scnWidth/2,
          child: TextButton(
          
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const RegistrationPopup();
               },
            );
          },
          child: const  Text(
            textAlign:TextAlign.center,
            'Don\'t have an account? Sign Up',
            style: TextStyle(
              
              color: Colors.blue,
            ),
          ),
        ),
        )

        ],),
        
      ],)
      )
       
      ],
    ),
       );
       }
    );
}
}