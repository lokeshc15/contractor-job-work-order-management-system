import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

void logout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => LoginScreen()),
    (route) => false,
  );
}
