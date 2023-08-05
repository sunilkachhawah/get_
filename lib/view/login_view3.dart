import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_/controller/user_data_controller.dart';

class SignUp extends StatelessWidget {
  final UserDataController userDataController = Get.put(UserDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Form Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: userDataController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: userDataController.nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: userDataController.genderController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Gender';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: userDataController.emailController,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  userDataController.addUserDataToFirebase();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
