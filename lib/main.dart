import 'package:flutter/material.dart';

import './Screens/login_screen.dart';


void main() {
  runApp(
   App(),
  );
}

class App extends StatelessWidget {
   App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home:  HomePage(),
      // routes: {LoginScreen.routeName:(context) => const  LoginScreen()},
    );
  }
}

class HomePage extends StatelessWidget{
HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body:  Center(
        child: Stack(
          children: <Widget>[ 
          MyRectangle(width: 200, height: 100, color: Color.fromARGB(255, 152, 244, 54)),
          Text('Hello, world!',style: TextStyle(color:Color.fromARGB(255, 255, 44, 54,),),),
          ElevatedButton(
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) =>  LoginScreen()
                )
              );
            },
          child: Text('LOG IN'),
        ),
      ],
      ),
      )
    );
  }

}
class MyRectangle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const MyRectangle({
    required this.width,
    required this.height,
    required this.color,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
      ),
    );
  }
}