import 'dart:io';

import 'package:flutter/material.dart';

class MyThemeData {
  static final themeData = ThemeData(
    backgroundColor: Color(0xFF293462),
    primaryColor: Color(0xFF00818A),
    primaryColorLight: Color(0xFF216583),
    primaryColorDark: Color(0xFF293462),
  );
}
class AppControllers{
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static File? profileImage;
  static dynamic drivingLicense;
  static dynamic certificate;
  static dynamic passport;
}
