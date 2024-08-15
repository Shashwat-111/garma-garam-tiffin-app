import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/CartProvider.dart';
import '../widgets/tiffin_detail_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder:(context,cartProviderModal,child)=>ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 1 + cartProviderModal.initialMenuItem.length,
        itemBuilder: (context, index) {
          //for 1st index displaying the banner image, app bar, and banner image
          //for all other index the TiffinDetailCard will be displayed
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.location_pin),
                    const SizedBox(width: 10),
                    const Text("Choubey Colony"),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/notification");
                      },
                      child: const Icon(
                        Icons.notifications_none_sharp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Hello Shashwat!",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/testBanner.png"),
                ),
                const SizedBox(height: 20),
                Text(
                  "Select your Garma-Garam Meal For Tomorrow",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
              ],
            );
          } else {
            return Padding(
              key: ValueKey(cartProviderModal.initialMenuItem[index-1].id),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TiffinDetailCard(

                  onTapAdd: (){
                    cartProviderModal.addToCart(cartProviderModal.initialMenuItem[index-1]);
                    },
                  onTapRemove: (){
                    cartProviderModal.removeFromCart(cartProviderModal.initialMenuItem[index-1]);
                  },
                menuItem: cartProviderModal.initialMenuItem[index-1],
                currentQuantity: cartProviderModal.menuItemWithQuantity.containsKey(cartProviderModal.initialMenuItem[index-1])
                    ? cartProviderModal.menuItemWithQuantity[cartProviderModal.initialMenuItem[index-1]]!
                    : 0
              ),
            );
          }
        },
      ),
    );
  }
}