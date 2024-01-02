class AutocompletePrediction {
  final String? description;
  final StructuredFormating? structuredFormating;
  final String? placeId;
  final String? reference;
  AutocompletePrediction({
    this.description,
    this.structuredFormating,
    this.placeId,
    this.reference,
  });

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormating: json['structured_formating'] != null
          ? StructuredFormating.fromJson(json['structured_formating'])
          : null,
    );
  }
}

class StructuredFormating {
  final String? mainText;
  final String? secondaryText;

  StructuredFormating({
    this.mainText,
    this.secondaryText,
  });
  factory StructuredFormating.fromJson(Map<String, dynamic> json) {
    return StructuredFormating(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}
