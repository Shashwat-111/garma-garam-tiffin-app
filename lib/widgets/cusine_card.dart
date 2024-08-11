import 'package:flutter/material.dart';

class CuisineCard extends StatelessWidget {
  final String image;
  final String title;
  final String tiffinAvailable;
  const CuisineCard({
    super.key, required this.image, required this.title, required this.tiffinAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 90 , child: Center(child: Image.asset(image),)),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w700),),
          Text("$tiffinAvailable tiffins", style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}


//browse by cuisine feature, currently not available
//add the following code to the homepage ListView, with feature is available.
// Text(
//   "Browse By Cuisines",
//   style: Theme.of(context).textTheme.titleLarge,
// ),
// const SizedBox(height: 20),
// SizedBox(
//   width: 350,
//   height: 150,
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: availableCuisine.length,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5),
//         child: CuisineCard(
//           image: availableCuisine[index]["image"],
//           title: availableCuisine[index]["name"],
//           tiffinAvailable:
//           availableCuisine[index]["Available"].toString(),
//         ),
//       );
//     },
//   ),
// ),
// const SizedBox(height: 20),