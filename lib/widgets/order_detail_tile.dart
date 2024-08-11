import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/widgets/veg_nonveg_icon.dart';
enum OrderStatus {
  ongoing,
  delivered,
}

class OrderListTile extends StatelessWidget {
  final OrderStatus orderStatus;
  final String kitchenName;
  final bool isVeg;
  final String itemName;
  const OrderListTile({
    super.key,
    required this.orderStatus,
    required this.kitchenName,
    required this.isVeg,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: orderStatus == OrderStatus.ongoing
                    ? Colors.green[100]
                    : Colors.orange[50],
              ),
              child: orderStatus == OrderStatus.ongoing
                  ? const Row(
                children: [
                  Text(
                    "Ongoing",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  Spacer(),
                  Text("12/30 meals left")
                ],
              )
                  : const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Delivered",
                    style: TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                  Spacer(),
                  Text("on 12/08/2020",)
                ],
              )),
          const Text(
            "Dubey Kitchen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              VegNonVegIcon(isVeg: true),
              SizedBox(width: 10),
              Text(
                "Chole Thali",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios_sharp)
            ],
          ),
        ],
      ),
    );
  }
}
