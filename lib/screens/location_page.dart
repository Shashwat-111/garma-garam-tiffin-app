import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  Position? currentUserPosition;
  getLocation() async{
    Position userPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
    setState(() {
      currentUserPosition = userPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Location", style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            //search bar 
            SizedBox(
              height: 50,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search For Your Location",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
            //get current location button
            ListTile(
              onTap: (){
                getLocation();
              },
              leading: const Icon(Icons.gps_fixed_sharp),
              subtitle: currentUserPosition == null
                  ? null
                  : Text(
                  "${currentUserPosition!.latitude}  ${currentUserPosition!.longitude}"
              ),
              title: const Text("Use Current Location"),
              trailing: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
