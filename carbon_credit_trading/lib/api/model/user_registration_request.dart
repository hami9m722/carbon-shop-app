//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class UserRegistrationRequest {
  /// Returns a new [UserRegistrationRequest] instance.
  UserRegistrationRequest({
    required this.password,
    this.name,
    this.phone,
    required this.email,
    this.companyName,
    this.companyAddress,
    this.companyTaxCode,
    this.companyIndustry,
    this.companyPhone,
    this.companyEmail,
  });

  String password;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? phone;

  String email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? companyName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? companyAddress;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? companyTaxCode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? companyIndustry;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? companyPhone;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? companyEmail;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserRegistrationRequest &&
    other.password == password &&
    other.name == name &&
    other.phone == phone &&
    other.email == email &&
    other.companyName == companyName &&
    other.companyAddress == companyAddress &&
    other.companyTaxCode == companyTaxCode &&
    other.companyIndustry == companyIndustry &&
    other.companyPhone == companyPhone &&
    other.companyEmail == companyEmail;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (password.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (email.hashCode) +
    (companyName == null ? 0 : companyName!.hashCode) +
    (companyAddress == null ? 0 : companyAddress!.hashCode) +
    (companyTaxCode == null ? 0 : companyTaxCode!.hashCode) +
    (companyIndustry == null ? 0 : companyIndustry!.hashCode) +
    (companyPhone == null ? 0 : companyPhone!.hashCode) +
    (companyEmail == null ? 0 : companyEmail!.hashCode);

  @override
  String toString() => 'UserRegistrationRequest[password=$password, name=$name, phone=$phone, email=$email, companyName=$companyName, companyAddress=$companyAddress, companyTaxCode=$companyTaxCode, companyIndustry=$companyIndustry, companyPhone=$companyPhone, companyEmail=$companyEmail]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'password'] = this.password;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.phone != null) {
      json[r'phone'] = this.phone;
    } else {
      json[r'phone'] = null;
    }
      json[r'email'] = this.email;
    if (this.companyName != null) {
      json[r'companyName'] = this.companyName;
    } else {
      json[r'companyName'] = null;
    }
    if (this.companyAddress != null) {
      json[r'companyAddress'] = this.companyAddress;
    } else {
      json[r'companyAddress'] = null;
    }
    if (this.companyTaxCode != null) {
      json[r'companyTaxCode'] = this.companyTaxCode;
    } else {
      json[r'companyTaxCode'] = null;
    }
    if (this.companyIndustry != null) {
      json[r'companyIndustry'] = this.companyIndustry;
    } else {
      json[r'companyIndustry'] = null;
    }
    if (this.companyPhone != null) {
      json[r'companyPhone'] = this.companyPhone;
    } else {
      json[r'companyPhone'] = null;
    }
    if (this.companyEmail != null) {
      json[r'companyEmail'] = this.companyEmail;
    } else {
      json[r'companyEmail'] = null;
    }
    return json;
  }

  /// Returns a new [UserRegistrationRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserRegistrationRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserRegistrationRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserRegistrationRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserRegistrationRequest(
        password: mapValueOfType<String>(json, r'password')!,
        name: mapValueOfType<String>(json, r'name'),
        phone: mapValueOfType<String>(json, r'phone'),
        email: mapValueOfType<String>(json, r'email')!,
        companyName: mapValueOfType<String>(json, r'companyName'),
        companyAddress: mapValueOfType<String>(json, r'companyAddress'),
        companyTaxCode: mapValueOfType<String>(json, r'companyTaxCode'),
        companyIndustry: mapValueOfType<String>(json, r'companyIndustry'),
        companyPhone: mapValueOfType<String>(json, r'companyPhone'),
        companyEmail: mapValueOfType<String>(json, r'companyEmail'),
      );
    }
    return null;
  }

  static List<UserRegistrationRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserRegistrationRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserRegistrationRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserRegistrationRequest> mapFromJson(dynamic json) {
    final map = <String, UserRegistrationRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserRegistrationRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserRegistrationRequest-objects as value to a dart map
  static Map<String, List<UserRegistrationRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserRegistrationRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserRegistrationRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'password',
    'email',
  };
}

