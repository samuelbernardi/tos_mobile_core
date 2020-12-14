import 'dart:io';

import 'package:flutter/material.dart';

class CameraPreview extends StatelessWidget {
  final String image;

  CameraPreview({this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: AppBar(
            backgroundColor: Colors.black,
            leading: Container(),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.keyboard_return,
                  ),
                  onPressed: () {
                    File(image).delete();

                    Navigator.pop(context);
                  })
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  child: Image.file(File(image)),
                )),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16, top: 16),
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.save_alt,
                            size: 42,
                          ),
                          onPressed: () {
                            Navigator.pop(context, image);
                          },
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
