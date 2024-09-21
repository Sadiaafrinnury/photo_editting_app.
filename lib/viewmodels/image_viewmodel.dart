import 'dart:io';
import 'package:flutter/material.dart';
import '../services/image_service.dart';

class ImageViewModel extends ChangeNotifier {
  final ImageService _imageService = ImageService();
  List<File> _editedImages = [];

  List<File> get editedImages => _editedImages;

  Future<void> pickAndEditImage() async {
    File? pickedImage = await _imageService.pickImage();
    if (pickedImage != null) {
      File? croppedImage = await _imageService.cropImage(pickedImage);
      if (croppedImage != null) {
        String savedPath = await _imageService.saveImage(croppedImage);
        _editedImages.add(File(savedPath));
        notifyListeners();
      }
    }
  }
}
