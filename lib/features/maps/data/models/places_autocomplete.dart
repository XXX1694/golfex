import 'dart:convert';

import 'autocomplete_predictions.dart';

class PlacesAutocompleteResponse {
  final String? status;
  final List<AutocompletePrediction>? predictions;
  PlacesAutocompleteResponse({
    required this.predictions,
    required this.status,
  });
  factory PlacesAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    return PlacesAutocompleteResponse(
      // ignore: prefer_null_aware_operators
      predictions: json['predictions'] != null
          ? json['predictions']
              .map<AutocompletePrediction>(
                  (json) => AutocompletePrediction.fromJson(json))
              .toList()
          : null,
      status: json['status'],
    );
  }

  static PlacesAutocompleteResponse parseAutoCompleteResult(
      String responseBody) {
    final parsed = json.decode(responseBody).cast<String, dynamic>();

    return PlacesAutocompleteResponse.fromJson(parsed);
  }
}
