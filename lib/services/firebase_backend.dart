import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

enum Role {
  customer,
  restaurant,
  admin
}

//Class to store all the user details.
//contains methods to parse from and to json.
class UserModel {
  final String uniqueID;
  final String name;
  final String email;
  final String? address;
  final double? latitude;
  final double? longitude;
  final Role role;
  final String? mobileNumber;
  final bool? isVegetarian;

  UserModel({
    required this.uniqueID,
    required this.name,
    required this.email,
    this.address,
    this.latitude,
    this.longitude,
    required this.role,
    this.mobileNumber,
    this.isVegetarian,
  });

  // Helper function to create an empty user model
  static UserModel empty() => UserModel(
    uniqueID: "",
    name: "",
    email: "",
    address: "",
    latitude: null,
    longitude: 0,
    role: Role.customer,
    mobileNumber: null,
    isVegetarian: null,
  );

  // Convert a UserModel into a Map (toJson)
  Map<String, dynamic> toJson() {
    return {
      'uniqueID': uniqueID,
      'name': name,
      'email': email,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'role': role.toString().split('.').last, // Convert enum to string
      'mobileNumber': mobileNumber,
      'isVegetarian': isVegetarian,
    };
  }

  // Create a UserModel from a Map (fromJson)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uniqueID: json['uniqueID'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      role: Role.values.firstWhere((e) => e.toString() == 'Role.${json['role']}'),
      mobileNumber: json['mobileNumber'],
      isVegetarian: json['isVegetarian'],
    );
  }
}


///A function to save user record in the database.
///Call when signup is successful ,to add new user data to the firestore
///if record is written successfully the function returns true, else false.
Future<bool> saveUserRecord(UserModel user) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  try {
    await db.collection("User").doc(user.email).set(user.toJson());
    if (kDebugMode) {
      print("User record saved successfully.");
    }
    return true;
  } catch(e){
    if (kDebugMode) {
      print("Error while saving user record :$e");
    }
    return false;
  }
}




///Function to get all User details from a email id.
///returns a UserModel if the email exists in database.
///should only be called if the user is already
/// authenticated, to prevent getting a empty User.
Future<UserModel> getUserRecord(String email) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  try {
    DocumentSnapshot<Map<String, dynamic>> doc = await db.collection("User").doc(email).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!);
    } else {
      if (kDebugMode) {
        print("Document does not exist");
      }
      return UserModel.empty();
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error fetching user record: $e");
    }
    return UserModel.empty();
  }
}


//helper Function to get a string for the Role enum
String getStringFromRole(Role role){
  switch (role){
    case Role.admin :
      return "admin";
    case Role.customer :
      return "customer";
    case Role.restaurant:
      return "restaurant";
  }
}
