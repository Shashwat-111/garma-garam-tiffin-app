import 'dart:convert';

import 'package:http/http.dart' as http;
import '../utils/api_keys.dart';

Future <String>? getAutoCompleteData ({required String query}) async {
  try {
    final Uri uri = Uri.parse("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&types=geocode&components=country:in&key=$googleAutocompleteApiKey");

    final response = await http.get(uri).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200){
      return response.body;
    } else {
      return "Somthing went wrong";
    }
  } catch (e){
    return "No Internet";
  }
}

Future<Map<String, double>> getLatLngFromPlaceId(String placeId) async {
  final response = await http.get(
    Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapsApiKey'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final location = json['result']['geometry']['location'];
    print("get lat lang fx running");
    print(location['lat']);
    return {
      'lat': location['lat'],
      'lng': location['lng'],
    };
  } else {
    throw Exception('Failed to load place details');
  }
}