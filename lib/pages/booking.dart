import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  final String service;

  const Booking({super.key, required this.service});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
          ],
        ),
      ),
    );
  }
}
