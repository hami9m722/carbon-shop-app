//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class CompanyReviewDTO {
  /// Returns a new [CompanyReviewDTO] instance.
  CompanyReviewDTO({
    this.id,
    this.message,
    this.rate,
    this.images = const [],
    this.company,
    this.reviewBy,
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
  String? message;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rate;

  List<int> images;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? company;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? reviewBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CompanyReviewDTO &&
    other.id == id &&
    other.message == message &&
    other.rate == rate &&
    _deepEquality.equals(other.images, images) &&
    other.company == company &&
    other.reviewBy == reviewBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (rate == null ? 0 : rate!.hashCode) +
    (images.hashCode) +
    (company == null ? 0 : company!.hashCode) +
    (reviewBy == null ? 0 : reviewBy!.hashCode);

  @override
  String toString() => 'CompanyReviewDTO[id=$id, message=$message, rate=$rate, images=$images, company=$company, reviewBy=$reviewBy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.rate != null) {
      json[r'rate'] = this.rate;
    } else {
      json[r'rate'] = null;
    }
      json[r'images'] = this.images;
    if (this.company != null) {
      json[r'company'] = this.company;
    } else {
      json[r'company'] = null;
    }
    if (this.reviewBy != null) {
      json[r'reviewBy'] = this.reviewBy;
    } else {
      json[r'reviewBy'] = null;
    }
    return json;
  }

  /// Returns a new [CompanyReviewDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CompanyReviewDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CompanyReviewDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CompanyReviewDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CompanyReviewDTO(
        id: mapValueOfType<int>(json, r'id'),
        message: mapValueOfType<String>(json, r'message'),
        rate: mapValueOfType<int>(json, r'rate'),
        images: json[r'images'] is Iterable
            ? (json[r'images'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        company: mapValueOfType<int>(json, r'company'),
        reviewBy: mapValueOfType<int>(json, r'reviewBy'),
      );
    }
    return null;
  }

  static List<CompanyReviewDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CompanyReviewDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CompanyReviewDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CompanyReviewDTO> mapFromJson(dynamic json) {
    final map = <String, CompanyReviewDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CompanyReviewDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CompanyReviewDTO-objects as value to a dart map
  static Map<String, List<CompanyReviewDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CompanyReviewDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CompanyReviewDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

