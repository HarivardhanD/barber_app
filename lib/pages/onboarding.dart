
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Onboarding> {
  get screenHeight => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      backgroundColor: const Color.fromARGB(255, 222, 157, 157),

      body: Column(children:[
        Image.asset(
          'images/barber.jpeg',
          
          width: double.infinity,
          fit: BoxFit.cover           
          ),
          //add space btw image and text
          SizedBox(height: 20),

         Container(
          padding: EdgeInsets.all(12),
          
          decoration: BoxDecoration
         (color:Colors.white,
          borderRadius: BorderRadius.circular(12),
          ),
         
          child: Text(
            'Kill the trend with style',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight:FontWeight.bold,
              color:Colors.amber,
              letterSpacing: 1.5,
            ),
          )
         )
      
      
      ])
    );
  }
}
