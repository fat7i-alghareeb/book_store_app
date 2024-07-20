class Description {
  final String? type;
  final String? value;

  Description({this.type, this.value});

  factory Description.fromJson(dynamic json) {
    if (json is String) {
      return Description(value: json);
    } else if (json is Map<String, dynamic>) {
      return Description(
        type: json['type'] as String?,
        value: json['value'] as String,
      );
    } else {
      throw Exception('Unexpected JSON format for description');
    }
  }
  dynamic toJson() {
    if (type != null) {
      return {
        'type': type,
        'value': value,
      };
    } else {
      return value;
    }
  }
}
