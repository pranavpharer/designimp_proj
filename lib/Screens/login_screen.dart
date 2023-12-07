import 'package:flutter/material.dart';
import 'dart:math';
 
class LoginScreen extends StatefulWidget{
   LoginScreen({Key? key}) : super(key: key);
  
  @override
  State<LoginScreen> createState() =>  _loginScreenState(); 
  // static const routeName = '/login';
}
class _loginScreenState extends State<LoginScreen>{
@override  
Widget build(BuildContext context){
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return   Scaffold(
    
    body: Container(
      height: screenHeight,
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(10,screenHeight/10, 10, screenHeight/10),
      child:ImageWidget(),
    ),
  );
}
}
class ImageWidget extends StatelessWidget {
  ImageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return  Column(
      children: [
       Container(
        // height: double.maxFinite,
        // width: double.maxFinite,
       padding: EdgeInsets.fromLTRB(screenWidth/10,screenHeight/10,screenWidth/10,screenHeight/10),
       child: LogoAnimation()
       ),

        // Text
        const Text(
          'Welcome',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          'Log into your account and get started!',
          style: TextStyle(
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 16),

        // Email
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),

        const SizedBox(height: 16),

        // Password
        TextFormField(
          decoration:  const InputDecoration(
            labelText: 'Password',
          ),
        ),

        const SizedBox(height: 16),

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

        const SizedBox(height: 16),

        // Login Button
        ElevatedButton(
          onPressed: () {},
          child: const Text('LOG IN'),
        ),

        const SizedBox(height: 16),

        // Sign Up Button
        TextButton(
          onPressed: () {},
          child: const Text(
            'Don\'t have an account? Sign Up',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

class LogoAnimation extends StatefulWidget{
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}
class _LogoAnimationState extends State<LogoAnimation> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end:  2 * pi,
    ).animate(_animationController);

    _animationController.repeat(reverse: true);
  }

  @override
void dispose() {
    _animationController.dispose();
    super.dispose();
  }
Widget build(BuildContext context){
  return AnimatedBuilder(
    animation: _rotationAnimation, 
    builder: (context,child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                // ..rotateX(
                //   _rotationAnimation.value,
                // )
                ..rotateY(
                  _rotationAnimation.value,
                )
                // ..rotateZ(
                //   _rotationAnimation.value,
                // )
                ,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                // child: CustomPaint(painter: WPainter(animationValue: _animationController.value),)
              ),
            );
          },
    );
}

}

