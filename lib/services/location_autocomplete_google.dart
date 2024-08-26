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