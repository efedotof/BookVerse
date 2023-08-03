import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Lotties extends StatefulWidget {
  const Lotties({super.key,
    required this.image,
    required this.width,
    required this.heigth,
  });
  final String image;
  final double width;
  final double heigth;


  @override
  State<Lotties> createState() => _LottiesState();
}

class _LottiesState extends State<Lotties> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset('${widget.image}', height: widget.heigth,width: widget.width);
  }
}