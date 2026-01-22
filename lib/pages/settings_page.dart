import "package:flutter/material.dart";

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Center(child: Text("Settings Page"),),
    );
  }
}