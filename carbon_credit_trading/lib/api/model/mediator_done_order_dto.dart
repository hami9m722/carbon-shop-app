//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class MediatorDoneOrderDTO {
  /// Returns a new [MediatorDoneOrderDTO] instance.
  MediatorDoneOrderDTO({
    this.contractFile,
    this.certImages = const [],
    this.paymentBillFile,
    this.contractSignDate,
    this.payDate,
    this.deliveryDate,
    this.message,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? contractFile;

  List<int> certImages;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? paymentBillFile;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? contractSignDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? payDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? deliveryDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MediatorDoneOrderDTO &&
    other.contractFile == contractFile &&
    _deepEquality.equals(other.certImages, certImages) &&
    other.paymentBillFile == paymentBillFile &&
    other.contractSignDate == contractSignDate &&
    other.payDate == payDate &&
    other.deliveryDate == deliveryDate &&
    other.message == message;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contractFile == null ? 0 : contractFile!.hashCode) +
    (certImages.hashCode) +
    (paymentBillFile == null ? 0 : paymentBillFile!.hashCode) +
    (contractSignDate == null ? 0 : contractSignDate!.hashCode) +
    (payDate == null ? 0 : payDate!.hashCode) +
    (deliveryDate == null ? 0 : deliveryDate!.hashCode) +
    (message == null ? 0 : message!.hashCode);

  @override
  String toString() => 'MediatorDoneOrderDTO[contractFile=$contractFile, certImages=$certImages, paymentBillFile=$paymentBillFile, contractSignDate=$contractSignDate, payDate=$payDate, deliveryDate=$deliveryDate, message=$message]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.contractFile != null) {
      json[r'contractFile'] = this.contractFile;
    } else {
      json[r'contractFile'] = null;
    }
      json[r'certImages'] = this.certImages;
    if (this.paymentBillFile != null) {
      json[r'paymentBillFile'] = this.paymentBillFile;
    } else {
      json[r'paymentBillFile'] = null;
    }
    if (this.contractSignDate != null) {
      json[r'contractSignDate'] = this.contractSignDate!.toUtc().toIso8601String();
    } else {
      json[r'contractSignDate'] = null;
    }
    if (this.payDate != null) {
      json[r'payDate'] = this.payDate!.toUtc().toIso8601String();
    } else {
      json[r'payDate'] = null;
    }
    if (this.deliveryDate != null) {
      json[r'deliveryDate'] = this.deliveryDate!.toUtc().toIso8601String();
    } else {
      json[r'deliveryDate'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    return json;
  }

  /// Returns a new [MediatorDoneOrderDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MediatorDoneOrderDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "MediatorDoneOrderDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "MediatorDoneOrderDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return MediatorDoneOrderDTO(
        contractFile: mapValueOfType<int>(json, r'contractFile'),
        certImages: json[r'certImages'] is Iterable
            ? (json[r'certImages'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        paymentBillFile: mapValueOfType<int>(json, r'paymentBillFile'),
        contractSignDate: mapDateTime(json, r'contractSignDate', r''),
        payDate: mapDateTime(json, r'payDate', r''),
        deliveryDate: mapDateTime(json, r'deliveryDate', r''),
        message: mapValueOfType<String>(json, r'message'),
      );
    }
    return null;
  }

  static List<MediatorDoneOrderDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MediatorDoneOrderDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MediatorDoneOrderDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MediatorDoneOrderDTO> mapFromJson(dynamic json) {
    final map = <String, MediatorDoneOrderDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MediatorDoneOrderDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MediatorDoneOrderDTO-objects as value to a dart map
  static Map<String, List<MediatorDoneOrderDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MediatorDoneOrderDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MediatorDoneOrderDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

