import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/order_detail_tile.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            "Ongoing Orders",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          OrderListTile(
              orderStatus: OrderStatus.ongoing,
              kitchenName: "Dubey kitchen",
              isVeg: true,
              itemName: "Chole Thali"),
          SizedBox(height: 10),
          Text(
            "Past Orders",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          OrderListTile(
              orderStatus: OrderStatus.delivered,
              kitchenName: "Dubey kitchen",
              isVeg: true,
              itemName: "Chole Thali"),
        ],
      ),
    );
  }
}