// in the services folder we will have code for firestore ( database )

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  static addUserDetails(Map<String,dynamic>userInfoMap ,String id) async{
    return await FirebaseFirestore.instance.collection("users").doc(id).set(userInfoMap);

  }
}