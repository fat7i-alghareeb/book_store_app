class Bio {
  final String? type;
  final String? value;

  Bio({this.type, this.value});

  factory Bio.fromJson(dynamic json) {
    if (json is String) {
      return Bio(value: json);
    } else if (json is Map<String, dynamic>) {
      return Bio(
        type: json['type'] as String?,
        value: json['value'] as String,
      );
    } else {
      throw Exception('Unexpected JSON format for Bio');
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
