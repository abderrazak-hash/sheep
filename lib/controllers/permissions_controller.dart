import 'package:flutter/material.dart';
import 'package:smart_shoeherd/widgets/boxes/camera_access_box.dart';
import 'package:smart_shoeherd/widgets/boxes/gallery_access_box.dart';

class PermissionsController extends ChangeNotifier {
  bool askCameraPermission(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CameraAccessBox(),
    );
    return false;
  }

  bool askGalleryPermission(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const GalleryAccessBox(),
    );
    return false;
  }
}
