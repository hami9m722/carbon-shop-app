//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class ApiFieldError {
  /// Returns a new [ApiFieldError] instance.
  ApiFieldError({
    this.code,
    this.message,
    this.property,
    this.rejectedValue,
    this.path,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? property;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? rejectedValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApiFieldError &&
    other.code == code &&
    other.message == message &&
    other.property == property &&
    other.rejectedValue == rejectedValue &&
    other.path == path;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (code == null ? 0 : code!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (property == null ? 0 : property!.hashCode) +
    (rejectedValue == null ? 0 : rejectedValue!.hashCode) +
    (path == null ? 0 : path!.hashCode);

  @override
  String toString() => 'ApiFieldError[code=$code, message=$message, property=$property, rejectedValue=$rejectedValue, path=$path]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.property != null) {
      json[r'property'] = this.property;
    } else {
      json[r'property'] = null;
    }
    if (this.rejectedValue != null) {
      json[r'rejectedValue'] = this.rejectedValue;
    } else {
      json[r'rejectedValue'] = null;
    }
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    return json;
  }

  /// Returns a new [ApiFieldError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApiFieldError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ApiFieldError[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ApiFieldError[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ApiFieldError(
        code: mapValueOfType<String>(json, r'code'),
        message: mapValueOfType<String>(json, r'message'),
        property: mapValueOfType<String>(json, r'property'),
        rejectedValue: mapValueOfType<Object>(json, r'rejectedValue'),
        path: mapValueOfType<String>(json, r'path'),
      );
    }
    return null;
  }

  static List<ApiFieldError> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApiFieldError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApiFieldError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApiFieldError> mapFromJson(dynamic json) {
    final map = <String, ApiFieldError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApiFieldError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApiFieldError-objects as value to a dart map
  static Map<String, List<ApiFieldError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ApiFieldError>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApiFieldError.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

