import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _image;

  Future CamaraImage() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 400, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  Future GalleryImage() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 400, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.blue,
            child: _image == null
                ? Center(child: Text('No Image Selected'))
                : Image.file(
                    _image,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fitHeight,
                  ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  CamaraImage();
                },
                child: Icon(Icons.camera),
              ),
              SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: () {
                  GalleryImage();
                },
                child: Icon(Icons.photo_library),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
