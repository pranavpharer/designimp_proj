import 'package:flutter/material.dart';

class form extends StatefulWidget{
  
  @override
  State<form> createState() => _newForm();

}

class _newForm extends State<form>{
  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar:  AppBar(
        title: const Text("the Form"),
      ),
      body: Padding (
        padding: const EdgeInsets.all(10),
        child: Form(child: Container()),
      ),
    );
  }
}