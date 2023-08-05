import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_/models/user_data_model.dart';

class UserDataController extends GetxController {
  // form key
  final formKey = GlobalKey<FormState>();

  //for a view page
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();

  // add query for add data to firebase
  Future<void> addUserDataToFirebase() async {
    if (formKey.currentState!.validate()) {
      UserDataModel userData = UserDataModel(
        name: nameController.text,
        gender: genderController.text,
        email: emailController.text,
      );

      try {
        // Check if the email already exists in Firestore
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('userdata')
            .where('email', isEqualTo: userData.email)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // Email already exists in Firestore
          Get.snackbar('Error', 'Email already exists.');
        } else {
          // Email is unique, add the data to Firestore
          await FirebaseFirestore.instance
              .collection('userdata')
              .add(userData.toJson());
          Get.snackbar('Success', 'You registered successfully');
        }
      } catch (error) {
        Get.snackbar('Error', 'Failed to add form data to Firebase.');
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    genderController.dispose();
    super.dispose();
  }
}
