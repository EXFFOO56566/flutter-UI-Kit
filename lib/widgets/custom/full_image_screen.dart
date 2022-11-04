///
/// File : Full Image
/// Version : 1.0.0
///

import 'package:flutter/material.dart';

class FullImageScreen extends StatefulWidget {
  final String imagePath, imageTag;
  final int? backgroundOpacity;

  const FullImageScreen(
      {Key? key,
      required this.imagePath,
      required this.imageTag,
      this.backgroundOpacity})
      : super(key: key);

  @override
  _FullImageScreenState createState() => _FullImageScreenState();
}

class _FullImageScreenState extends State<FullImageScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black.withAlpha(
            widget.backgroundOpacity == null ? 220 : widget.backgroundOpacity!),
        body: Center(
          child: Hero(
            tag: widget.imageTag,
            child: Image.asset(
              widget.imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
