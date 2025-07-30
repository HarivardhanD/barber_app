import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(child: Column(children:[
        GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },

        child: Padding(padding: const EdgeInsets.only(left:20.0,top:40.0),
        child: Icon(Icons.arrow_back_ios_new_rounded,color:Colors.white,size: 30.0)
      )
      )
      ],
      
      ),
      ),

    );
  }
}