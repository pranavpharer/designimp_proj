import 'package:flutter/material.dart';
import 'dart:math';
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
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
    return   AnimatedBuilder(
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
                width: screenWidth/5,
                height: screenHeight/10,
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