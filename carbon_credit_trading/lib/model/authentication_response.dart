//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class AuthenticationResponse {
  /// Returns a new [AuthenticationResponse] instance.
  AuthenticationResponse({
    this.accessToken,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accessToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthenticationResponse &&
    other.accessToken == accessToken;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accessToken == null ? 0 : accessToken!.hashCode);

  @override
  String toString() => 'AuthenticationResponse[accessToken=$accessToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessToken != null) {
      json[r'accessToken'] = this.accessToken;
    } else {
      json[r'accessToken'] = null;
    }
    return json;
  }

  /// Returns a new [AuthenticationResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthenticationResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthenticationResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthenticationResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthenticationResponse(
        accessToken: mapValueOfType<String>(json, r'accessToken'),
      );
    }
    return null;
  }

  static List<AuthenticationResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthenticationResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthenticationResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthenticationResponse> mapFromJson(dynamic json) {
    final map = <String, AuthenticationResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthenticationResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthenticationResponse-objects as value to a dart map
  static Map<String, List<AuthenticationResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthenticationResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthenticationResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

