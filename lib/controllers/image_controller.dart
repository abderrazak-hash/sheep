import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shoeherd/widgets/boxes/unsupported_format_box.dart';
import 'package:smart_shoeherd/widgets/boxes/upload_error_box.dart';
// import 'package:image_picker/image_picker.dart';

class ImageController extends ChangeNotifier {
  late String? sheepImage, teethImage;
  ImageController() {
    sheepImage = null;
    teethImage = null;
  }

  late final ImagePicker _imagePicker = ImagePicker();

  void capturesheepImage(BuildContext context, ImageSource source) async {
    final result = await _imagePicker.pickImage(
      source: source,
    );
    if (result != null) {
      double size = (await result.readAsBytes()).lengthInBytes / 1024;
      if (size > 40 && size < 120) {
        if (result.mimeType!.toUpperCase() == 'JPG' ||
            result.mimeType!.toUpperCase() == 'JPEG' ||
            result.mimeType!.toUpperCase() == 'PNG') {
          sheepImage = result.path;
        } else {
          showDialog(
            context: context,
            builder: (context) => const UnsupportedFormatBox(),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => const UploadErrorBox(),
        );
      }
    }

    notifyListeners();
  }

  void captureTeethImage(BuildContext context, ImageSource source) async {
    final result = await _imagePicker.pickImage(
      source: source,
    );
    if (result != null) {
      double size = (await result.readAsBytes()).lengthInBytes / 1024;
      if (size > 40 && size < 120) {
        if (result.mimeType!.toUpperCase() == 'JPG' ||
            result.mimeType!.toUpperCase() == 'JPEG' ||
            result.mimeType!.toUpperCase() == 'PNG') {
          teethImage = result.path;
        } else {
          showDialog(
            context: context,
            builder: (context) => const UnsupportedFormatBox(),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => const UploadErrorBox(),
        );
      }
    }
    notifyListeners();
  }
}
