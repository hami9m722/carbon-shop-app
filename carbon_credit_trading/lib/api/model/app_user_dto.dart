//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class AppUserDTO {
  /// Returns a new [AppUserDTO] instance.
  AppUserDTO({
    this.userId,
    this.name,
    this.phone,
    this.email,
    required this.role,
    this.approvedAt,
    this.rejectedAt,
    this.status,
    this.company,
    this.favoriteProjects = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userId;

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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  AppUserDTORoleEnum role;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? approvedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? rejectedAt;

  AppUserDTOStatusEnum? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? company;

  List<int> favoriteProjects;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppUserDTO &&
    other.userId == userId &&
    other.name == name &&
    other.phone == phone &&
    other.email == email &&
    other.role == role &&
    other.approvedAt == approvedAt &&
    other.rejectedAt == rejectedAt &&
    other.status == status &&
    other.company == company &&
    _deepEquality.equals(other.favoriteProjects, favoriteProjects);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (userId == null ? 0 : userId!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (phone == null ? 0 : phone!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (role.hashCode) +
    (approvedAt == null ? 0 : approvedAt!.hashCode) +
    (rejectedAt == null ? 0 : rejectedAt!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (company == null ? 0 : company!.hashCode) +
    (favoriteProjects.hashCode);

  @override
  String toString() => 'AppUserDTO[userId=$userId, name=$name, phone=$phone, email=$email, role=$role, approvedAt=$approvedAt, rejectedAt=$rejectedAt, status=$status, company=$company, favoriteProjects=$favoriteProjects]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.userId != null) {
      json[r'userId'] = this.userId;
    } else {
      json[r'userId'] = null;
    }
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
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
      json[r'role'] = this.role;
    if (this.approvedAt != null) {
      json[r'approvedAt'] = this.approvedAt!.toUtc().toIso8601String();
    } else {
      json[r'approvedAt'] = null;
    }
    if (this.rejectedAt != null) {
      json[r'rejectedAt'] = this.rejectedAt!.toUtc().toIso8601String();
    } else {
      json[r'rejectedAt'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.company != null) {
      json[r'company'] = this.company;
    } else {
      json[r'company'] = null;
    }
      json[r'favoriteProjects'] = this.favoriteProjects;
    return json;
  }

  /// Returns a new [AppUserDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppUserDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppUserDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppUserDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppUserDTO(
        userId: mapValueOfType<int>(json, r'userId'),
        name: mapValueOfType<String>(json, r'name'),
        phone: mapValueOfType<String>(json, r'phone'),
        email: mapValueOfType<String>(json, r'email'),
        role: AppUserDTORoleEnum.fromJson(json[r'role'])!,
        approvedAt: mapDateTime(json, r'approvedAt', r''),
        rejectedAt: mapDateTime(json, r'rejectedAt', r''),
        status: AppUserDTOStatusEnum.fromJson(json[r'status']),
        company: mapValueOfType<int>(json, r'company'),
        favoriteProjects: json[r'favoriteProjects'] is Iterable
            ? (json[r'favoriteProjects'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<AppUserDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserDTO> mapFromJson(dynamic json) {
    final map = <String, AppUserDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserDTO-objects as value to a dart map
  static Map<String, List<AppUserDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppUserDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'role',
  };
}


class AppUserDTORoleEnum {
  /// Instantiate a new enum with the provided [value].
  const AppUserDTORoleEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const SELLER_OR_BUYER = AppUserDTORoleEnum._(r'SELLER_OR_BUYER');
  static const MEDIATOR = AppUserDTORoleEnum._(r'MEDIATOR');
  static const unknownDefaultOpenApi = AppUserDTORoleEnum._(r'unknown_default_open_api');

  /// List of all possible values in this [enum][AppUserDTORoleEnum].
  static const values = <AppUserDTORoleEnum>[
    SELLER_OR_BUYER,
    MEDIATOR,
    unknownDefaultOpenApi,
  ];

  static AppUserDTORoleEnum? fromJson(dynamic value) => AppUserDTORoleEnumTypeTransformer().decode(value);

  static List<AppUserDTORoleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserDTORoleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserDTORoleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AppUserDTORoleEnum] to String,
/// and [decode] dynamic data back to [AppUserDTORoleEnum].
class AppUserDTORoleEnumTypeTransformer {
  factory AppUserDTORoleEnumTypeTransformer() => _instance ??= const AppUserDTORoleEnumTypeTransformer._();

  const AppUserDTORoleEnumTypeTransformer._();

  String encode(AppUserDTORoleEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AppUserDTORoleEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AppUserDTORoleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'SELLER_OR_BUYER': return AppUserDTORoleEnum.SELLER_OR_BUYER;
        case r'MEDIATOR': return AppUserDTORoleEnum.MEDIATOR;
        case r'unknown_default_open_api': return AppUserDTORoleEnum.unknownDefaultOpenApi;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AppUserDTORoleEnumTypeTransformer] instance.
  static AppUserDTORoleEnumTypeTransformer? _instance;
}



class AppUserDTOStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const AppUserDTOStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const INIT = AppUserDTOStatusEnum._(r'INIT');
  static const APPROVED = AppUserDTOStatusEnum._(r'APPROVED');
  static const REJECTED = AppUserDTOStatusEnum._(r'REJECTED');
  static const unknownDefaultOpenApi = AppUserDTOStatusEnum._(r'unknown_default_open_api');

  /// List of all possible values in this [enum][AppUserDTOStatusEnum].
  static const values = <AppUserDTOStatusEnum>[
    INIT,
    APPROVED,
    REJECTED,
    unknownDefaultOpenApi,
  ];

  static AppUserDTOStatusEnum? fromJson(dynamic value) => AppUserDTOStatusEnumTypeTransformer().decode(value);

  static List<AppUserDTOStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserDTOStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserDTOStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AppUserDTOStatusEnum] to String,
/// and [decode] dynamic data back to [AppUserDTOStatusEnum].
class AppUserDTOStatusEnumTypeTransformer {
  factory AppUserDTOStatusEnumTypeTransformer() => _instance ??= const AppUserDTOStatusEnumTypeTransformer._();

  const AppUserDTOStatusEnumTypeTransformer._();

  String encode(AppUserDTOStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AppUserDTOStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AppUserDTOStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'INIT': return AppUserDTOStatusEnum.INIT;
        case r'APPROVED': return AppUserDTOStatusEnum.APPROVED;
        case r'REJECTED': return AppUserDTOStatusEnum.REJECTED;
        case r'unknown_default_open_api': return AppUserDTOStatusEnum.unknownDefaultOpenApi;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AppUserDTOStatusEnumTypeTransformer] instance.
  static AppUserDTOStatusEnumTypeTransformer? _instance;
}


