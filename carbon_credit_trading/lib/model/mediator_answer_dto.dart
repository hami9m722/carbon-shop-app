//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class MediatorAnswerDTO {
  /// Returns a new [MediatorAnswerDTO] instance.
  MediatorAnswerDTO({
    this.questionId,
    this.answer,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? questionId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? answer;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MediatorAnswerDTO &&
    other.questionId == questionId &&
    other.answer == answer;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (questionId == null ? 0 : questionId!.hashCode) +
    (answer == null ? 0 : answer!.hashCode);

  @override
  String toString() => 'MediatorAnswerDTO[questionId=$questionId, answer=$answer]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.questionId != null) {
      json[r'questionId'] = this.questionId;
    } else {
      json[r'questionId'] = null;
    }
    if (this.answer != null) {
      json[r'answer'] = this.answer;
    } else {
      json[r'answer'] = null;
    }
    return json;
  }

  /// Returns a new [MediatorAnswerDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MediatorAnswerDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MediatorAnswerDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MediatorAnswerDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MediatorAnswerDTO(
        questionId: mapValueOfType<int>(json, r'questionId'),
        answer: mapValueOfType<String>(json, r'answer'),
      );
    }
    return null;
  }

  static List<MediatorAnswerDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MediatorAnswerDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MediatorAnswerDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MediatorAnswerDTO> mapFromJson(dynamic json) {
    final map = <String, MediatorAnswerDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MediatorAnswerDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MediatorAnswerDTO-objects as value to a dart map
  static Map<String, List<MediatorAnswerDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MediatorAnswerDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MediatorAnswerDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

