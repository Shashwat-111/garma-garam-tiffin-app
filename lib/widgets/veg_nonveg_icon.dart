import 'package:flutter/material.dart';

class VegNonVegIcon extends StatelessWidget {
  final bool isVeg;
  const VegNonVegIcon({super.key, required this.isVeg});

  @override
  Widget build(BuildContext context) {
    Color color = isVeg ? Colors.green : Colors.red;
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.check_box_outline_blank_sharp, color: color,size: 26,),
        Icon(Icons.circle_sharp, color: color,size: 12,),
      ],
    );
  }
}

