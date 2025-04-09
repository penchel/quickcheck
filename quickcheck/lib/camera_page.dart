  import 'package:flutter/material.dart';
  import 'package:image_picker/image_picker.dart';

  import 'dart:io';

  class CameraPage extends StatefulWidget {
    @override
    _CameraPageState createState() => _CameraPageState();
  }

  class _CameraPageState extends State<CameraPage> {
    File? _image;

    Future<void> _openCamera() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Abrir Câmera")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null ? Image.file(_image!) : Text("Nenhuma imagem"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _openCamera,
                child: Text("Abrir Câmera"),
              ),
            ],
          ),
        ),
      );
    }
  }
