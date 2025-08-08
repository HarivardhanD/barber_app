import 'package:barber_app/services/database.dart';
import 'package:barber_app/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  final String service;

  const Booking({super.key, required this.service});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  String ? name,email;

  getthedatafromsharedpref() async{
     name = await SharedPreferenceHelper.getUserName();
     email = await SharedPreferenceHelper.getUserEmail();
     setState(() {
       
     });
  }
  getontheload()async{
    await getthedatafromsharedpref();

    //setState() — Flutter framework method used to rebuild the UI when something changes (like updating name).
    setState(() {
      
    });
  }
 

 // when user will move to the home page init state is the first function to be executed ; 
  @override
  void initState() {
    getontheload();
    super.initState();
  }
  
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _pickDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void _pickTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0),
                child: Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white, size: 30.0),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Let's begin your ${widget.service} journey",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Image
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "images/barber.jpeg",
                fit: BoxFit.cover,
                height: 350,
              ),
            ),
            const SizedBox(height: 20),

            // Service clicked
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Service clicked: ${widget.service}",
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(height: 20),

            // Date Picker Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: _pickDate,
                child: Text(selectedDate == null
                    ? "Select Date"
                    : "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
              ),
            ),

            const SizedBox(height: 10),

            // Time Picker Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: _pickTime,
                child: Text(selectedTime == null
                    ? "Select Time"
                    : "Time: ${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}"),
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () async{
                if (selectedDate == null || selectedTime == null || name == null || email == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please fill all the fields before booking."),
      ),
    );
    return;
  }
                Map<String,dynamic>userBookingmap={
                  "Service":widget.service,
                  "Date":"${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}".toString(),
                  "Time":"${selectedTime!.hour}:${selectedTime!.minute}".toString(),
                  "UserName":name,
                  "Email":email,
                };
                await DatabaseMethods.addBookingDetails(userBookingmap);
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid password",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)));
                  
                
                

              },
            
            child:Container(
              
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromARGB(255, 148, 200, 244)),
              child:Center(
              child: 
              Text("Book" ,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ),
            ),



            
          ],
        ),
      ),
    );
  }
}
