import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key, required this.imagePickFn})
      : super(key: key);
  final Function(File pickImage) imagePickFn;

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  var _pickedImage;
  Future _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedImage =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      if (pickedImage == null) return;
      final pickedImageFile = File(pickedImage.path);
      setState(() {
        _pickedImage = pickedImageFile;
      });
      widget.imagePickFn(pickedImageFile);
    } catch (e) {
      print(e);
    }
// final pickedImageFile = File(pickedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage) : null,
          radius: 40.0,
        ),
        TextButton.icon(
          onPressed: () {
            _pickImage();
          },
          icon: Icon(Icons.image),
          label: Text(
            "Add Image",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
