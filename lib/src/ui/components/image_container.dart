import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.width,
    this.height = 125,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.borderRadius = 20.0,
    this.child,
  });

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          opacity: 0.9,
        ),
      ),
      child: child,
    );
  }
}

class ImageNewsContainer extends StatelessWidget {
  const ImageNewsContainer({
    super.key,
    required this.width,
    this.height = 125,
    required this.imageUrl,
    this.padding,
    this.margin,
    this.borderRadius = 20.0,
    this.child,
  });

  final double width;
  final double height;
  final String imageUrl;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: NetworkImage(imageUrl),
          fit: BoxFit.contain,
          opacity: 0.9,
        ),
      ),
      child: child,
    );
  }
}
