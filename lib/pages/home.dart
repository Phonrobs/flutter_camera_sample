import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  File _imageFile;

  Widget _showImageFile() {
    if (_imageFile != null) {
      return Image.file(_imageFile);
    } else {
      return Text('No image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Sample'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
                child: OutlineButton(
                  child: Text('Take Photo'),
                  onPressed: () {
                    ImagePicker.pickImage(source: ImageSource.camera)
                        .then((file) {
                      setState(() {
                        _imageFile = file;
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: OutlineButton(
                  child: Text('Open Galery'),
                  onPressed: () {
                    ImagePicker.pickImage(source: ImageSource.gallery)
                        .then((file) {
                      setState(() {
                        _imageFile = file;
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: OutlineButton(
                  child: Text('Clear'),
                  onPressed: () {
                    setState(() {
                      _imageFile = null;
                    });
                  },
                ),
              ),
            ],
          ),
          _showImageFile(),
        ],
      ),
    );
  }
}
