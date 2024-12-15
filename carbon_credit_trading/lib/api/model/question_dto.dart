//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class QuestionDTO {
  /// Returns a new [QuestionDTO] instance.
  QuestionDTO({
    this.id,
    this.question,
    this.answer,
    this.askedBy,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? question;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? answer;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? askedBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuestionDTO &&
    other.id == id &&
    other.question == question &&
    other.answer == answer &&
    other.askedBy == askedBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (question == null ? 0 : question!.hashCode) +
    (answer == null ? 0 : answer!.hashCode) +
    (askedBy == null ? 0 : askedBy!.hashCode);

  @override
  String toString() => 'QuestionDTO[id=$id, question=$question, answer=$answer, askedBy=$askedBy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.question != null) {
      json[r'question'] = this.question;
    } else {
      json[r'question'] = null;
    }
    if (this.answer != null) {
      json[r'answer'] = this.answer;
    } else {
      json[r'answer'] = null;
    }
    if (this.askedBy != null) {
      json[r'askedBy'] = this.askedBy;
    } else {
      json[r'askedBy'] = null;
    }
    return json;
  }

  /// Returns a new [QuestionDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static QuestionDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "QuestionDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "QuestionDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return QuestionDTO(
        id: mapValueOfType<int>(json, r'id'),
        question: mapValueOfType<String>(json, r'question'),
        answer: mapValueOfType<String>(json, r'answer'),
        askedBy: mapValueOfType<int>(json, r'askedBy'),
      );
    }
    return null;
  }

  static List<QuestionDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <QuestionDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = QuestionDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, QuestionDTO> mapFromJson(dynamic json) {
    final map = <String, QuestionDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuestionDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of QuestionDTO-objects as value to a dart map
  static Map<String, List<QuestionDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<QuestionDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = QuestionDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

