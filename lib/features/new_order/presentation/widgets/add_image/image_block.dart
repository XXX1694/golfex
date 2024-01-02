import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_picker.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key, required this.callback});
  final Function(String) callback;
  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  List<String> img = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: img.length + 1,
        itemBuilder: (context, index) {
          if (index == img.length) {
            return CupertinoButton(
              padding: const EdgeInsets.all(0),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                height: 74,
                width: 74,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.grey,
                  ),
                ),
              ),
              onPressed: () async {
                final String imageUrl = await pickUploadImage();
                img.add(imageUrl);
                widget.callback(imageUrl);
                setState(() {});
              },
            );
          } else {
            return CupertinoButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FullScreenImage(imageUrl: img[index]),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                height: 74,
                width: 74,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(img[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Изображение',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Hero(
            tag: imageUrl,
            child: Image.file(
              File(imageUrl),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
