// ignore_for_file: type=lint
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 17,
              child: Image.asset("assets/testBanner.png", fit: BoxFit.fill,)),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dubey's Kitchen", style: TextStyle(fontSize:12 ,fontWeight: FontWeight.w300),),
                Text("Economy Lunch Tiffin", style: TextStyle(fontSize: 16,fontWeight:FontWeight.w700 )),
                Text("Gujrathi", style: TextStyle(fontSize:12,fontWeight :FontWeight.w300)),
                Text("4 Roti, Sabji, Dal, Rice", style: TextStyle(fontSize: 12,fontWeight:FontWeight.w300 ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
