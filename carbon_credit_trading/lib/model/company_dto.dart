//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class CompanyDTO {
  /// Returns a new [CompanyDTO] instance.
  CompanyDTO({
    this.id,
    this.name,
    this.address,
    this.taxCode,
    this.email,
    this.industry,
    this.status,
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
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? address;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? taxCode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? industry;

  CompanyDTOStatusEnum? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CompanyDTO &&
    other.id == id &&
    other.name == name &&
    other.address == address &&
    other.taxCode == taxCode &&
    other.email == email &&
    other.industry == industry &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (address == null ? 0 : address!.hashCode) +
    (taxCode == null ? 0 : taxCode!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (industry == null ? 0 : industry!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'CompanyDTO[id=$id, name=$name, address=$address, taxCode=$taxCode, email=$email, industry=$industry, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.address != null) {
      json[r'address'] = this.address;
    } else {
      json[r'address'] = null;
    }
    if (this.taxCode != null) {
      json[r'taxCode'] = this.taxCode;
    } else {
      json[r'taxCode'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.industry != null) {
      json[r'industry'] = this.industry;
    } else {
      json[r'industry'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [CompanyDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CompanyDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CompanyDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CompanyDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CompanyDTO(
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        address: mapValueOfType<String>(json, r'address'),
        taxCode: mapValueOfType<String>(json, r'taxCode'),
        email: mapValueOfType<String>(json, r'email'),
        industry: mapValueOfType<String>(json, r'industry'),
        status: CompanyDTOStatusEnum.fromJson(json[r'status']),
      );
    }
    return null;
  }

  static List<CompanyDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CompanyDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CompanyDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CompanyDTO> mapFromJson(dynamic json) {
    final map = <String, CompanyDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CompanyDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CompanyDTO-objects as value to a dart map
  static Map<String, List<CompanyDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CompanyDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CompanyDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class CompanyDTOStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const CompanyDTOStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const INIT = CompanyDTOStatusEnum._(r'INIT');
  static const APPROVED = CompanyDTOStatusEnum._(r'APPROVED');
  static const REJECTED = CompanyDTOStatusEnum._(r'REJECTED');
  static const unknownDefaultOpenApi = CompanyDTOStatusEnum._(r'unknown_default_open_api');

  /// List of all possible values in this [enum][CompanyDTOStatusEnum].
  static const values = <CompanyDTOStatusEnum>[
    INIT,
    APPROVED,
    REJECTED,
    unknownDefaultOpenApi,
  ];

  static CompanyDTOStatusEnum? fromJson(dynamic value) => CompanyDTOStatusEnumTypeTransformer().decode(value);

  static List<CompanyDTOStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CompanyDTOStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CompanyDTOStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CompanyDTOStatusEnum] to String,
/// and [decode] dynamic data back to [CompanyDTOStatusEnum].
class CompanyDTOStatusEnumTypeTransformer {
  factory CompanyDTOStatusEnumTypeTransformer() => _instance ??= const CompanyDTOStatusEnumTypeTransformer._();

  const CompanyDTOStatusEnumTypeTransformer._();

  String encode(CompanyDTOStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a CompanyDTOStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CompanyDTOStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'INIT': return CompanyDTOStatusEnum.INIT;
        case r'APPROVED': return CompanyDTOStatusEnum.APPROVED;
        case r'REJECTED': return CompanyDTOStatusEnum.REJECTED;
        case r'unknown_default_open_api': return CompanyDTOStatusEnum.unknownDefaultOpenApi;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CompanyDTOStatusEnumTypeTransformer] instance.
  static CompanyDTOStatusEnumTypeTransformer? _instance;
}


