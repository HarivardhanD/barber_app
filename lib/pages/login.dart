import 'home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => LogInState();
}

class LogInState extends State<LogIn> {
  String ? email , password ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

 userlogin()async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
    Navigator.push(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) =>Home()),
        );
  // ignore: unused_catch_clause
  }on FirebaseAuthException catch(e)
  {
    if(e.code=='user-not-found'){
      ScaffoldMessenger .of(context).showSnackBar(SnackBar(content: Text("Invalid email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)));}
    else if(e.code=='wrong-password'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid password",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)));
    }
    
  }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Blue top container
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.blueAccent),
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: const Text(
              "Heyyy ! \nLogIn",
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 191, 147, 147),
              ),
            ),
          ),

          // Login form container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child:Form(
                  key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "GMAIL",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                     TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                      } else{
                        return null;
                      }
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.mail_lock_outlined),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                     Text(
                      
                      "Password",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                     TextFormField(
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Enter your password";
                        }else{
                          return null;
                        }
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Forget password?",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    GestureDetector(
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          setState(() {
                            email = emailController.text ;
                            password = passwordController.text;
                          });
                          userlogin();
                        }

                      },
                    
                    child:  Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ],
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
