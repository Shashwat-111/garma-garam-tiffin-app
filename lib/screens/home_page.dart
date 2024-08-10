import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/widgets/restaurant_card.dart';
import '../widgets/cusine_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> availableCuisine = [
    {'name': 'Rajasthani', 'image': 'assets/RajisthaniFood.png', 'Available': 5},
    {'name': 'Punjabi', 'image': 'assets/punjabiFood.png', 'Available': 8},
    {'name': 'Gujrathi', 'image': 'assets/gujrathiFood.png', 'Available': 12},
    {
      'name': 'South Indian',
      'image': 'assets/southIndianFood.png',
      'Available': 10
    },
    {'name': 'Bengali', 'image': 'assets/BengaliFood.png', 'Available': 7},
  ];


  
   List restaurantData = List.generate(10,(inxed)=> 1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello Shashwat!",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/testBanner.png"),
                ),
                const SizedBox(height: 20),
                Text(
                  "Browse By Cuisines",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableCuisine.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CuisineCard(
                          image: availableCuisine[index]["image"],
                          title: availableCuisine[index]["name"],
                          tiffinAvailable:
                          availableCuisine[index]["Available"].toString(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "All Kitchens Around You",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
              ],
            );
          } else if (index == 1 + restaurantData.length) {
            return const SizedBox(height: 20); // Bottom padding
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: RestaurantCard(),
            );
          }
        },
      ),
    );
  }
}
