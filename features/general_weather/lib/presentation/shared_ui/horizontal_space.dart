import 'package:flutter/material.dart';

class HorizotalSpace extends StatelessWidget {
  final double spaceLength;
  const HorizotalSpace({required this.spaceLength, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: spaceLength);
  }
}
