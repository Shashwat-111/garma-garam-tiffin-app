// To parse this JSON data, do
//
//     final autocompletePrediction = autocompletePredictionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AutocompletePrediction autocompletePredictionFromJson(String str) => AutocompletePrediction.fromJson(json.decode(str));

String autocompletePredictionToJson(AutocompletePrediction data) => json.encode(data.toJson());

class AutocompletePrediction {
  final List<Prediction>? predictions;
  final String status;

  AutocompletePrediction({
    required this.predictions,
    required this.status,
  });

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) => AutocompletePrediction(
    predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "predictions": List<dynamic>.from(predictions!.map((x) => x.toJson())),
    "status": status,
  };
}

class Prediction {
  final String? description;
  final List<MatchedSubstring>? matchedSubstrings;
  final String? placeId;
  final String? reference;
  final StructuredFormatting? structuredFormatting;
  final List<Term>? terms;
  final List<String>? types;  // Updated to List<String>? for handling null

  Prediction({
    this.description,
    this.matchedSubstrings,
    this.placeId,
    this.reference,
    this.structuredFormatting,
    this.terms,
    this.types,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    description: json["description"] as String?,
    matchedSubstrings: json["matched_substrings"] == null ? null : List<MatchedSubstring>.from(json["matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
    placeId: json["place_id"] as String?,
    reference: json["reference"] as String?,
    structuredFormatting: json["structured_formatting"] == null ? null : StructuredFormatting.fromJson(json["structured_formatting"]),
    terms: json["terms"] == null ? null : List<Term>.from(json["terms"].map((x) => Term.fromJson(x))),
    types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x as String)),  // Handling null safely
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "matched_substrings": matchedSubstrings == null ? null : List<dynamic>.from(matchedSubstrings!.map((x) => x.toJson())),
    "place_id": placeId,
    "reference": reference,
    "structured_formatting": structuredFormatting?.toJson(),
    "terms": terms == null ? null : List<dynamic>.from(terms!.map((x) => x.toJson())),
    "types": types == null ? null : List<dynamic>.from(types!.map((x) => x)),
  };
}


class MatchedSubstring {
  final int length;
  final int offset;

  MatchedSubstring({
    required this.length,
    required this.offset,
  });

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) => MatchedSubstring(
    length: json["length"],
    offset: json["offset"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "offset": offset,
  };
}

class StructuredFormatting {
  final String mainText;
  final List<MatchedSubstring> mainTextMatchedSubstrings;
  final String? secondaryText;

  StructuredFormatting({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) => StructuredFormatting(
    mainText: json["main_text"],
    mainTextMatchedSubstrings: List<MatchedSubstring>.from(json["main_text_matched_substrings"].map((x) => MatchedSubstring.fromJson(x))),
    secondaryText: json["secondary_text"],
  );

  Map<String, dynamic> toJson() => {
    "main_text": mainText,
    "main_text_matched_substrings": List<dynamic>.from(mainTextMatchedSubstrings.map((x) => x.toJson())),
    "secondary_text": secondaryText,
  };
}

class Term {
  final int offset;
  final String value;

  Term({
    required this.offset,
    required this.value,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
    offset: json["offset"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "value": value,
  };
}

enum Type {
  GEOCODE,
  LOCALITY,
  POLITICAL
}

final typeValues = EnumValues({
  "geocode": Type.GEOCODE,
  "locality": Type.LOCALITY,
  "political": Type.POLITICAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
