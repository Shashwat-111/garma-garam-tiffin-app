import "package:flutter/material.dart";
import "../widgets/default_button.dart";
import "../widgets/veg_nonveg_icon.dart";

class KitchenPage extends StatefulWidget {
  const KitchenPage({super.key});

  @override
  State<KitchenPage> createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_sharp),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_sharp)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.share_sharp)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //const KitchenDetailsCard(),
            const SizedBox(height: 10,),
            Text("MEALS", style: Theme.of(context).textTheme.titleLarge,),
            const Spacer(), // display the weekly menu here if available
            SizedBox(
              width: double.infinity,
                child: DefaultButton(onPressed: (){}, text: "Subscribe")),
            SizedBox(
                width: double.infinity,
                child: DefaultButton(onPressed: (){}, text: "Book Trial")),

        ],),
      ),
    );
  }
}
