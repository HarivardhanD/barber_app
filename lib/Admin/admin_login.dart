import 'package:barber_app/Admin/booking_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

   void loginAdmin() {
    FirebaseFirestore.instance.collection("ADMIN").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()['id'] != usernameController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid id")),
          );
        } else if (result.data()['password'] != passwordController.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid password")),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookingAdmin()),
          );
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            
            padding: EdgeInsets.only(left: 20,top: 40),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 33, 146, 238),),
            child: Text("Admin Login \n Panel",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          
          
            Container(
              child: Text("LOGIN ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
            ),

            SizedBox(height: 20,),

          Form(child:Container( 
            
            
            padding: EdgeInsets.only(left: 30,right: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child:TextField(
              
              controller: usernameController,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300,color: Colors.black),
            
            decoration: InputDecoration(hintText: "AdminName",prefixIcon: Icon(Icons.mail_lock_outlined), ),

          ),
          ),
           

          

          ),
          SizedBox(height: 40,),

          Form(child:Container( 
            padding: EdgeInsets.only(left: 30,right: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child:TextField(
              controller: passwordController,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300,color: Colors.black),
            decoration: InputDecoration(hintText: "Passowrd",prefixIcon: Icon(Icons.password_rounded), ),
            obscureText: true,


          ),
          ),
          ),
          
          SizedBox(height: 50,),

          GestureDetector(
            onTap: (){
              loginAdmin();
            },
         child: Container(
            
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/15,
            padding: EdgeInsets.only(left: 150,top: 10),
            decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(20),color: Colors.red),
            child : Text("LOGIN",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
          ),
          ),
          
             
       

        
            
          
        ],
      ),

    );
   
   // ignore: dead_code
    

   
  }
}