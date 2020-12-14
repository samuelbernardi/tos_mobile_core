import 'package:adv_camera/adv_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/widgets/appbar.widget.dart';
import 'package:tos_mobile_core/widgets/camera/camera.bloc.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends ModularState<CameraWidget, CameraBloc> {
  String imagePath;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;

    return Scaffold(
        appBar: AppbarWidget(
          centerTitle: true,
          leading: Container(),
          title: 'Camera',
          actions: [
            IconButton(
              icon: Icon(
                Icons.close,
                size: 26.0,
              ),
              onPressed: () {
                Navigator.pop(context, null);
              },
            ),
          ],
        ),
        body: Stack(children: [
          AdvCamera(
            onCameraCreated: controller.onCameraCreated,
            onImageCaptured: controller.imageCaptured,
            cameraPreviewRatio: CameraPreviewRatio.r16_9,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.9)),
                child: Container(
                  height: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: IconButton(
                            icon: Icon(
                              Icons.photo_library,
                              size: 26.67,
                            ),
                            color: Colors.white,
                            onPressed: null), //controller.pickImage),
                      ),
                      Expanded(
                        child: IconButton(
                            icon: Icon(
                              Icons.camera,
                              size: 42,
                            ),
                            color: Colors.white,
                            onPressed: controller.takePicture),
                      ),
                      Expanded(
                        child: Consumer<CameraBloc>(
                          builder: (context, value) {
                            return IconButton(
                                icon: Icon(
                                    value.flashType == FlashType.torch
                                        ? Icons.flash_on
                                        : Icons.flash_off,
                                    size: 26.67),
                                color: Colors.white,
                                onPressed: () {
                                  controller.toggleFlash();
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ]));
  }
}
