import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/Providers/CartProvider.dart';
import 'package:garma_garam_tiffin_app/widgets/tiffin_detail_card.dart';
import 'package:provider/provider.dart';

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
            child: Consumer<CartProvider>(
              builder:(context,cartProviderModal,child) =>ListView.builder(
                itemCount: cartProviderModal.menuItemWithQuantity.keys.length,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TiffinDetailCard(

                    onTapAdd: (){
                      cartProviderModal.addToCart(cartProviderModal.menuItemWithQuantity.keys.toList()[index]);
                    },
                    onTapRemove: (){

                    },
                    menuItem: cartProviderModal.menuItemWithQuantity.keys.toList()[index],
                    currentQuantity: cartProviderModal.menuItemWithQuantity.values.toList()[index],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
