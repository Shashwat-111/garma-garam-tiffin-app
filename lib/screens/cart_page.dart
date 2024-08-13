import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/widgets/tiffin_detail_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Text("Items in your cart", style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22
          ),),
          const SizedBox(height: 10,),
          Expanded(
            flex: 16,
            child: ListView.builder(
              itemCount: 5,
                itemBuilder: (context, index){
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: TiffinDetailCard(),
              );
            }),
          ),
          const Divider(),
          Container(
            width: double.infinity,
            height: 180,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(

                      columns: const [
                        DataColumn(label: Text("Name")),
                        DataColumn(label: Text("Quantity")),
                        DataColumn(label: Text("Amount"))
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text("Chole Thali")),
                          DataCell(Text("3")),
                          DataCell(Text("₹380")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Chole Thali")),
                          DataCell(Text("3")),
                          DataCell(Text("₹380")),
                        ]),
                        DataRow(cells: [
                          DataCell(Text("Chole Thali")),
                          DataCell(Text("3")),
                          DataCell(Text("₹380")),
                        ]),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
