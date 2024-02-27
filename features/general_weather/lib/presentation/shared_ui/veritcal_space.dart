import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  final double spaceLength;
  const VerticalSpace({required this.spaceLength, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: spaceLength);
  }
}
