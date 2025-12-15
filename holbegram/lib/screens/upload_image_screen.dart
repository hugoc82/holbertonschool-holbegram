import 'package:flutter/material.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  void _onPickImage(BuildContext context) {
    // TODO: ImagePicker + Cloudinary upload (task suivante)
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Pick image clicked (TODO)')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Image')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _onPickImage(context),
              child: const Text('Pick & Upload Image'),
            ),
          ),
        ),
      ),
    );
  }
}
