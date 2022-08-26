
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  const ImageContainer({
    Key? key,
    this.height = 120,
    this.borderRadius = 30,
    required this.width,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover),
      ),
      child:child
    );
  }
}
