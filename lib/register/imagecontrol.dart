import 'package:flutter/material.dart';
import 'package:demo_nv/resources/imagestring.dart';

class ImgControl extends StatefulWidget {
  const ImgControl({super.key});

  @override
  State<ImgControl> createState() => _ImgControlState();
}

class _ImgControlState extends State<ImgControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
        Image(
          image: AssetImage(s1),
        ),
      ),
    );
  }
}