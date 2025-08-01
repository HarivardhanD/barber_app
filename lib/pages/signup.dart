import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController textcontroller =  TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
 
  final _formKey =GlobalKey<FormState>(); // check if the all the fields are filled in text field 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Stack(
        children: [
          // Blue top container
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.blueAccent),
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: const Text(
              "Heyyy!\nCreate an account now !",
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
              
              child: SingleChildScrollView( // singlechildScrollView can fit any screen and not cause overflow problem
              child:Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "DETAILS REQUIRED",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),

                    TextFormField( // to check the form we make TextField as TextFormField
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: textcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter your Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 20),

                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Please enter your email';
                        }
                      return null;
                      },
                      controller: mailcontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.mail_lock_outlined),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 20),

                    
                    TextFormField(
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return 'Please enter your password';
                      }
                      return null;
                      },
                      controller: passcontroller,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 20),

                    
                    const SizedBox(height: 10),

                    Container(
                      decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(20))),
                    
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),),);
                      },
                    
                    child:Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 197, 155, 169),
                          borderRadius: BorderRadius.circular(20),
                          
                          
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ),
                    )
                  
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
