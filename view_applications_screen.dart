import 'package:flutter/material.dart';

class ViewApplicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Applications"),
        backgroundColor: const Color(0xFF4B6CB7),
      ),
      body: const Center(
        child: Text(
          "Applications list will appear here",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
