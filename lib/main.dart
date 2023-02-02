import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_shoeherd/controllers/image_controller.dart';
import 'package:smart_shoeherd/controllers/permissions_controller.dart';
import 'package:smart_shoeherd/screens/start_screen.dart';

void main() {
  runApp(
    const SheepApp(),
  );
}

class SheepApp extends StatelessWidget {
  const SheepApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PermissionsController>(
          create: (context) => PermissionsController(),
        ),
        ChangeNotifierProvider<ImageController>(
          create: (context) => ImageController(),
        ),
      ],
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StartScreen(),
        );
      },
    );
  }
}
