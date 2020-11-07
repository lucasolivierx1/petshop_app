import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SplashPage')),
      body: Center(
        child: Container(
          width: 64,
          height: 64,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
