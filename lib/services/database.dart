// in the services folder we will have code for firestore ( database )

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  static addUserDetails(Map<String,dynamic>userInfoMap ,String id) async{
    return await FirebaseFirestore.instance.collection("users").doc(id).set(userInfoMap);

  }

 static Future<void> addBookingDetails(Map<String, dynamic> userInfoMap) async {
  try {
    print(" Attempting to add booking: $userInfoMap");

    await FirebaseFirestore.instance
        .collection("Booking")  // Must match case!
        .add(userInfoMap);

    print(" Booking added successfully.");
  } catch (e) {
    print(" Error adding booking: $e");
    rethrow; // Let UI handle error
  }
}

}