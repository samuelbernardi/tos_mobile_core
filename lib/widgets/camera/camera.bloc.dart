import 'dart:io';

import 'package:adv_camera/adv_camera.dart';
import 'package:adv_image_picker/adv_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tos_mobile_core/bloc/base-bloc.dart';
import 'package:tos_mobile_core/widgets/camera/camera-preview.widget.dart';

class CameraBloc extends BaseBloc {
  AdvCameraController cameraController;
  String imagePath;
  FlashType flashType;
  BuildContext context;
  List<File> files = [];

  onCameraCreated(AdvCameraController controller) {
    cameraController = controller;

    cameraController.getPictureSizes().then((pictureSizes) {});

    flashType = FlashType.off;
    cameraController.setFlashType(flashType);
  }

  imageCaptured(String path) async {
    print("onImageCaptured => " + path);
    imagePath = path;

    var result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CameraPreview(
        image: imagePath,
      );
    }));

    if (result != null) {
      Navigator.pop(context, imagePath);
    }
  }

  takePicture() {
    flashType = FlashType.off;
    notifyListeners();

    cameraController.captureImage();
  }

  toggleFlash() {
    switch (flashType) {
      case FlashType.off:
        {
          flashType = FlashType.torch;

          break;
        }
      case FlashType.torch:
        {
          flashType = FlashType.off;

          break;
        }
    }

    cameraController.setFlashType(flashType);

    notifyListeners();
  }

  pickImage() async {
    files = [];

    AdvImagePicker.cancel = 'Cancelar';
    AdvImagePicker.confirm = 'Confirmar';
    AdvImagePicker.confirmation = 'Imagem selecionada';

    files.addAll(await AdvImagePicker.pickImagesToFile(context,
        maxSize: 4080,
        allowMultiple: false,
        usingCamera: false,
        usingGallery: true));

    if (files.isNotEmpty) {
      Navigator.pop(context, files.first.path);
    }
  }
}
