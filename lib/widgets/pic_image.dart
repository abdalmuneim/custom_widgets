import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePic {
  static ImagePic? _instance;
  // Avoid self instance
  ImagePic._();
  static ImagePic get instance => _instance ??= ImagePic._();

  Future<File?> _getImage(ImageSource source) async {
    XFile? imageResult = await ImagePicker().pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 100,
    );
    if (imageResult != null) {
      return File(imageResult.path);
    } else {
      return null;
    }
  }

  Future<File?> _getMedia() async {
    XFile? imageResult = await ImagePicker().pickMedia();
    if (imageResult != null) {
      return File(imageResult.path);
    } else {
      return null;
    }
  }

  Future<List<File>?> _getMultiFiles() async {
    List<XFile> imageResult = await ImagePicker().pickMultiImage();
    List<File> files = [];
    if (imageResult.isNotEmpty) {
      for (var e in imageResult) {
        files.add(File(e.path));
      }
      return files;
    } else {
      return null;
    }
  }

  bool _isbottomSheetOppened = false;
  showBottomSheetPic(
    BuildContext context, {
    final String? lableCamera,
    final String? lableGallery,
    bool camera = true,
    bool gallery = true,
    bool video = true,
    bool multiFiles = false,
  }) {
    _isbottomSheetOppened = true;
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: Colors.white,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// camera
            if (camera)
              InkWell(
                onTap: () async {
                  await _getImage(ImageSource.camera).then((File? value) {
                    Navigator.canPop(context)
                        ? Navigator.of(context).pop(value)
                        : null;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera,
                      color: Colors.green,
                      size: 50,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      lableCamera ?? "Camera",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

            /// gallery
            if (gallery)
              InkWell(
                onTap: () async {
                  if (multiFiles) {
                    await _getMultiFiles().then((List<File>? value) {
                      if (_isbottomSheetOppened) {
                        Navigator.of(context).pop(value);
                      }
                      return value;
                    });
                  } else {
                    await _getImage(ImageSource.gallery).then((File? value) {
                      if (_isbottomSheetOppened) {
                        Navigator.of(context).pop(value);
                      }
                    });
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image,
                      color: Colors.green,
                      size: 50,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      lableGallery ?? "Gallery",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
