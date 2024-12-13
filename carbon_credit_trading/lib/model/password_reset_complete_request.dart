//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class PasswordResetCompleteRequest {
  /// Returns a new [PasswordResetCompleteRequest] instance.
  PasswordResetCompleteRequest({
    required this.uid,
    required this.newPassword,
  });

  String uid;

  String newPassword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PasswordResetCompleteRequest &&
    other.uid == uid &&
    other.newPassword == newPassword;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (uid.hashCode) +
    (newPassword.hashCode);

  @override
  String toString() => 'PasswordResetCompleteRequest[uid=$uid, newPassword=$newPassword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'uid'] = this.uid;
      json[r'newPassword'] = this.newPassword;
    return json;
  }

  /// Returns a new [PasswordResetCompleteRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PasswordResetCompleteRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PasswordResetCompleteRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PasswordResetCompleteRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PasswordResetCompleteRequest(
        uid: mapValueOfType<String>(json, r'uid')!,
        newPassword: mapValueOfType<String>(json, r'newPassword')!,
      );
    }
    return null;
  }

  static List<PasswordResetCompleteRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PasswordResetCompleteRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PasswordResetCompleteRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PasswordResetCompleteRequest> mapFromJson(dynamic json) {
    final map = <String, PasswordResetCompleteRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PasswordResetCompleteRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PasswordResetCompleteRequest-objects as value to a dart map
  static Map<String, List<PasswordResetCompleteRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PasswordResetCompleteRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PasswordResetCompleteRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'uid',
    'newPassword',
  };
}

