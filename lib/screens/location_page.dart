import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "../services/location_autocomplete_google.dart";
import "../utils/models/location_autocomplete.dart";

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


  List<Prediction> predictionList = [];
  TextEditingController searchController = TextEditingController();
  Set<Prediction> pastSearch = {};

  void placeAutoComplete(String query) async {
    String? response = await getAutoCompleteData(query: query);
    if (response != null) {
      AutocompletePrediction autocompletePrediction =
      autocompletePredictionFromJson(response);
      if (autocompletePrediction.predictions != null) {
        setState(() {
          predictionList = autocompletePrediction.predictions!;
        });
      }
    }
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
            buildSearchBar(),
            // SizedBox(
            //   height: 50,
            //   child: TextField(
            //     textAlignVertical: TextAlignVertical.bottom,
            //     decoration: InputDecoration(
            //       fillColor: Colors.white,
            //       prefixIcon: const Icon(Icons.search),
            //       hintText: "Search For Your Location",
            //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
            //     ),
            //   ),
            // ),
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
            buildPredictionList()
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: searchController,
        keyboardType: TextInputType.streetAddress,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black),
          ),
          hintText: "Search for a location",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: searchController.text.isEmpty
              ? null
              : IconButton(
            icon: const Icon(Icons.cancel_sharp),
            onPressed: () {
              setState(() {
                searchController.clear();
                predictionList.clear();
              });
            },
          ),
        ),
        onChanged: (query) {
          placeAutoComplete(query);
        },
      ),
    );
  }

  Widget buildPredictionList() {
    return Expanded(
      child: ListView.builder(
        itemCount: searchController.text.isEmpty ? pastSearch.length : predictionList.length,
        itemBuilder: (context, index) {
          var prediction = searchController.text.isEmpty
              ? pastSearch.elementAt(index)
              : predictionList[index];
          return InkWell(
            onTap: () {
              getLatLngFromPlaceId(prediction.placeId.toString()).then((value)=> {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LocationMapScreen(prediction: value),
                  ),
                )
              });
              setState(() {
                pastSearch.add(prediction);
              });
            },
            child: prediction.structuredFormatting == null ?
                null :
            ListTile(
              leading: Icon(searchController.text.isEmpty
                  ? Icons.access_time_outlined
                  : Icons.location_pin),
              title: Text(prediction.structuredFormatting!.mainText ),
              subtitle: prediction.structuredFormatting!.secondaryText != null
                  ? Text(prediction.structuredFormatting!.secondaryText!)
                  : null,
              trailing: const Icon(Icons.call_made_outlined),
            ),
          );
        },
      ),
    );
  }
}


class LocationMapScreen extends StatefulWidget {
  final Map<String, double> prediction;
  const LocationMapScreen({super.key, required this.prediction});

  @override
  State<LocationMapScreen> createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  late double? lat;
  late double? lng;
  @override
  void initState() {
    lat = widget.prediction["lat"];
    lng = widget.prediction["lng"];
    print(lat);
    print(lng);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (lat == null){
      return const CircularProgressIndicator();
    } else {
      return GoogleMap(
        markers: {
          Marker(
            markerId: const MarkerId('sourceLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(lat!, lng!),
          ),
        },
        initialCameraPosition: CameraPosition(target: LatLng(lat!, lng!),
          zoom: 13,
        )
    );
    }
  }
}
