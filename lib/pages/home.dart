import 'package:barber_app/pages/booking.dart';
import 'package:barber_app/services/shared_pref.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String ? name;

  getthedatafromsharedpref() async{
     name = await SharedPreferenceHelper.getUserName();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with greeting and profile picture
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                       name!,
                      style:
                          const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/barber.jpeg'),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(color: Colors.black),

            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Our Services',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildServiceTile('Shave'),
                  _buildServiceTile('Hair Cut'),
                  _buildServiceTile('Shampoo'),
                  _buildServiceTile('Nailing'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildServiceTile(String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Booking(service: title),
          ),
        );
      },
      child: Container(
        width: 140,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
