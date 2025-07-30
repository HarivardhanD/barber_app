import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.amber,
      body:
      Padding(padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Text('Hello',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),

              Text('Harivardhan',
              style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
            ],
            
          ),
          
        
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('images/barber.jpeg'),

          ),

          

          
        ],

      ),
      
      Divider(color: Colors.black,),
      SizedBox(height: 30.0,),

       const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Services',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

      SizedBox(height: 20),
      
      Center(
      child :Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: [
          _buildserviceTile('shave'),
          _buildserviceTile('Hair cut'),
          _buildserviceTile('Shampoo'),
          _buildserviceTile('Nailing')

        ],
      )
      )
      


      
      
        ],
      ),
      ),
      );

  }
  
  Widget _buildserviceTile(String title) {
    return Container(
      width: 140,
      height: 100,
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
      
    
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Text(
          title,
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ],
    )
    );

    

  }
}