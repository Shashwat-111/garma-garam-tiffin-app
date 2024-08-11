import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/widgets/restaurant_card.dart';
import '../widgets/cusine_card.dart';
import '../widgets/tiffin_detail_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List restaurantData = List.generate(5,(index)=> 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 6 + restaurantData.length, // Adjust itemCount based on the content
        itemBuilder: (context, index) {
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
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TiffinDetailCard(),
            );
          }
        },
      ),
    );
  }
}