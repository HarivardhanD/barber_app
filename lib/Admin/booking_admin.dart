import 'package:flutter/material.dart';

class BookingAdmin extends StatefulWidget {
  const BookingAdmin({super.key});

  @override
  State<BookingAdmin> createState() => _BookingAdminState();
}

class _BookingAdminState extends State<BookingAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (body: Container(
      
      
      child: Column(
        
        
        
        children: [
          
           
          Center(child: Container(
            padding: EdgeInsets.only(left: 10,top: 20),
            
           
            
            
            
            child: Text("All Bookings ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 15, 14, 14)),),
          ),),
          SizedBox(height: 30,),

          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(30),
            

            child: Container(
              
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              padding: EdgeInsets.only(left: 10,top: 10),
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(30),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "Name : Amma",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Service : Haircut",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Date : 4/11/2003",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Time : 12:00 pm",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.only(left: 60),
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,),
                      child: Text("Done",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold,color: Colors.black),),
                    )



                    
                   
                  ],
             
                
              ),
              

            ),
          
            

          ),
           
                    
        ],
        
        
      ),
      
    ),);
  }
}