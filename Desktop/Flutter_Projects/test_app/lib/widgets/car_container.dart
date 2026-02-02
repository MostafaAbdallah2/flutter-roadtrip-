import 'package:flutter/material.dart';
import '../constans.dart';

class CarContainer extends StatelessWidget {
  final Animation<Offset> carMoveAnimation;

  const CarContainer({required this.carMoveAnimation, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      height: 70,
      width: 82,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [purpleDark50, purpleLight50, purpleAccent50],
        ),
        boxShadow: [
          BoxShadow(color: purplePrimary50, blurRadius: 25, spreadRadius: 3),
          BoxShadow(color: purpleLight50, blurRadius: 15, spreadRadius: 1),
        ],
      ),
      child: SlideTransition(
        position: carMoveAnimation,
        child: Image.asset('images/mini-car_14514026.png', scale: 10.0),
      ),
    );
  }
}
