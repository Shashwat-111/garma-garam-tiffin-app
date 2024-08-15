import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/Providers/CartProvider.dart';
import 'package:garma_garam_tiffin_app/widgets/veg_nonveg_icon.dart';

class TiffinDetailCard extends StatefulWidget {
  final VoidCallback onTapAdd;
  final VoidCallback onTapRemove;
  final MenuItem menuItem;
  final int currentQuantity;
  const TiffinDetailCard({super.key, required this.onTapAdd, required this.onTapRemove, required this.menuItem, required this.currentQuantity});

  @override
  State<TiffinDetailCard> createState() => _TiffinDetailCardState();
}

class _TiffinDetailCardState extends State<TiffinDetailCard> {


  late int initialItemCount;

  @override
  void initState() {
    initialItemCount = widget.currentQuantity;
    super.initState();
  }

  void addItem(){
    setState(() {
      initialItemCount++;
      widget.onTapAdd();
    });
  }

  void removeItem(){
    setState(() {
      if(initialItemCount>0){
        initialItemCount--;
        widget.onTapRemove();
      }
    });
  }

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
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.menuItem.kitchenName.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const VegNonVegIcon(isVeg: true),
                    const SizedBox(width: 10),
                    Text(widget.menuItem.foodName.toString(), style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16))
                  ],
                ),
                const Text(
                  "Chole ki sabji + 5 roti + dal+ rice + Boondi Raita",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                  overflow: TextOverflow.clip,),
                const SizedBox(height: 7),
                Text(widget.menuItem.price.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
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
                          child: initialItemCount == 0
                              ? SizedBox(
                                height: 40,
                                width: 80,
                                child: ElevatedButton(
                                onPressed: (){
                                  addItem();
                                },
                                child: const Text("ADD")),
                              )

                              : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.purple[50]
                            ),
                            child: SizedBox(
                              height: 40,
                              width: 80,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                      onTap: (){
                                        removeItem();
                                      },
                                      child: const Icon(Icons.remove),
                                  ),
                                  Text(initialItemCount.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                                  GestureDetector(
                                    onTap: (){
                                      addItem();
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                          )
                      )
                    ]
              ),
            ),
          )
        ],
      )
    );
  }
}
