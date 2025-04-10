// camera_page.dart
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  bool _isCameraInitialized = false;
  XFile? _capturedImage;

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.first;

    _controller = CameraController(frontCamera, ResolutionPreset.high);

    await _controller!.initialize();

    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;

    final image = await _controller!.takePicture();

    setState(() {
      _capturedImage = image;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: !_isCameraInitialized
          ? ElevatedButton(
        onPressed: _initCamera,
        child: const Text("Abrir Câmera"),
      )
          : Column(
        children: [
          AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: CameraPreview(_controller!),
          ),
          ElevatedButton(
            onPressed: _takePicture,
            child: const Text("Tirar Foto"),
          ),
          if (_capturedImage != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(
                File(_capturedImage!.path),
                height: 200,
              ),
            ),
        ],
      ),
    );
  }
}
