import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void systemStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Status bar এর background color
      statusBarIconBrightness: Brightness.dark, // Android এ icon রঙ
      statusBarBrightness: Brightness.light, // iOS এ text রঙ
    ),
  );
}

