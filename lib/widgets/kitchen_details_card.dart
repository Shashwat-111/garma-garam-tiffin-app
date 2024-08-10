import "package:flutter/material.dart";

class KitchenDetailsCard extends StatelessWidget {
  const KitchenDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dubey's Kitchen", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Text("Gujarathi", style: TextStyle(fontWeight: FontWeight.w500),),
          Divider(),
          Text("200 subscribers", style: TextStyle(fontWeight: FontWeight.w300),),
          Divider(),
          Text("Lunch Dinner", style: TextStyle(fontWeight: FontWeight.w300),),
          Divider(),
          Text("Dilivers in all of Raipur", style: TextStyle(fontWeight: FontWeight.w300),),
        ],
      ),
    );
  }
}

