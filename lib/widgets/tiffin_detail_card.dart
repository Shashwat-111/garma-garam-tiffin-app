import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/widgets/veg_nonveg_icon.dart';

class TiffinDetailCard extends StatefulWidget {
  const TiffinDetailCard({super.key});

  @override
  State<TiffinDetailCard> createState() => _TiffinDetailCardState();
}

class _TiffinDetailCardState extends State<TiffinDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //text details column
          const Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dubey Kitchen", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VegNonVegIcon(isVeg: true),
                    SizedBox(width: 10),
                    Text("Chole Thali", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16))
                  ],
                ),
                Text(
                  "Chole ki sabji + 5 roti + dal+ rice + Boondi Raita",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                  overflow: TextOverflow.clip,),
                SizedBox(height: 7),
                Text("₹120", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
          ),

          //Image and add button stack
          Expanded(
            flex: 1,
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children:
                    [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: ClipRRect(
                            borderRadius:BorderRadius.circular(12),
                            child: Image.asset("assets/choleThaliImage.jpg")),
                      ),
                        //margin: EdgeInsets.only(bottom: 12,left: 5,right: 5),),
                      Positioned(
                          top: 80,
                          child: ElevatedButton(onPressed: (){}, child: Text("ADD")))
                    ]
              ),
            ),
          )
        ],
      )
    );
  }
}
