import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileController extends GetxController {
  var selectedImagePath = ''.obs;

  void setImagePath(String path) {
    selectedImagePath.value = path;
  }
}

class ProfilePage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      profileController.setImagePath(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
                  () => CircleAvatar(
                radius: 80,
                backgroundImage: profileController.selectedImagePath.value.isNotEmpty
                    ? FileImage(File(profileController.selectedImagePath.value))
                    : null,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Ambil Foto di Galeri'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Ambil Foto dengan Kamera'),
            ),
          ],
        ),
      ),
    );
  }
}
