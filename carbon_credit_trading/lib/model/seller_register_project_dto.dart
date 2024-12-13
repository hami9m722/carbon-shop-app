//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class SellerRegisterProjectDTO {
  /// Returns a new [SellerRegisterProjectDTO] instance.
  SellerRegisterProjectDTO({
    this.name,
    this.address,
    this.size,
    this.timeStart,
    this.timeEnd,
    this.produceCarbonRate,
    this.partner,
    this.auditByOrg,
    this.creditAmount,
    this.cert,
    this.price,
    this.methodPayment,
    this.projectImages = const [],
  });

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
  String? size;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? timeStart;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? timeEnd;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? produceCarbonRate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? partner;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? auditByOrg;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? creditAmount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cert;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? price;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? methodPayment;

  List<int> projectImages;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SellerRegisterProjectDTO &&
    other.name == name &&
    other.address == address &&
    other.size == size &&
    other.timeStart == timeStart &&
    other.timeEnd == timeEnd &&
    other.produceCarbonRate == produceCarbonRate &&
    other.partner == partner &&
    other.auditByOrg == auditByOrg &&
    other.creditAmount == creditAmount &&
    other.cert == cert &&
    other.price == price &&
    other.methodPayment == methodPayment &&
    _deepEquality.equals(other.projectImages, projectImages);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (address == null ? 0 : address!.hashCode) +
    (size == null ? 0 : size!.hashCode) +
    (timeStart == null ? 0 : timeStart!.hashCode) +
    (timeEnd == null ? 0 : timeEnd!.hashCode) +
    (produceCarbonRate == null ? 0 : produceCarbonRate!.hashCode) +
    (partner == null ? 0 : partner!.hashCode) +
    (auditByOrg == null ? 0 : auditByOrg!.hashCode) +
    (creditAmount == null ? 0 : creditAmount!.hashCode) +
    (cert == null ? 0 : cert!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (methodPayment == null ? 0 : methodPayment!.hashCode) +
    (projectImages.hashCode);

  @override
  String toString() => 'SellerRegisterProjectDTO[name=$name, address=$address, size=$size, timeStart=$timeStart, timeEnd=$timeEnd, produceCarbonRate=$produceCarbonRate, partner=$partner, auditByOrg=$auditByOrg, creditAmount=$creditAmount, cert=$cert, price=$price, methodPayment=$methodPayment, projectImages=$projectImages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    if (this.timeStart != null) {
      json[r'timeStart'] = this.timeStart!.toUtc().toIso8601String();
    } else {
      json[r'timeStart'] = null;
    }
    if (this.timeEnd != null) {
      json[r'timeEnd'] = this.timeEnd!.toUtc().toIso8601String();
    } else {
      json[r'timeEnd'] = null;
    }
    if (this.produceCarbonRate != null) {
      json[r'produceCarbonRate'] = this.produceCarbonRate;
    } else {
      json[r'produceCarbonRate'] = null;
    }
    if (this.partner != null) {
      json[r'partner'] = this.partner;
    } else {
      json[r'partner'] = null;
    }
    if (this.auditByOrg != null) {
      json[r'auditByOrg'] = this.auditByOrg;
    } else {
      json[r'auditByOrg'] = null;
    }
    if (this.creditAmount != null) {
      json[r'creditAmount'] = this.creditAmount;
    } else {
      json[r'creditAmount'] = null;
    }
    if (this.cert != null) {
      json[r'cert'] = this.cert;
    } else {
      json[r'cert'] = null;
    }
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.methodPayment != null) {
      json[r'methodPayment'] = this.methodPayment;
    } else {
      json[r'methodPayment'] = null;
    }
      json[r'projectImages'] = this.projectImages;
    return json;
  }

  /// Returns a new [SellerRegisterProjectDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SellerRegisterProjectDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SellerRegisterProjectDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SellerRegisterProjectDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SellerRegisterProjectDTO(
        name: mapValueOfType<String>(json, r'name'),
        address: mapValueOfType<String>(json, r'address'),
        size: mapValueOfType<String>(json, r'size'),
        timeStart: mapDateTime(json, r'timeStart', r''),
        timeEnd: mapDateTime(json, r'timeEnd', r''),
        produceCarbonRate: mapValueOfType<String>(json, r'produceCarbonRate'),
        partner: mapValueOfType<String>(json, r'partner'),
        auditByOrg: mapValueOfType<String>(json, r'auditByOrg'),
        creditAmount: mapValueOfType<int>(json, r'creditAmount'),
        cert: mapValueOfType<String>(json, r'cert'),
        price: mapValueOfType<String>(json, r'price'),
        methodPayment: mapValueOfType<String>(json, r'methodPayment'),
        projectImages: json[r'projectImages'] is Iterable
            ? (json[r'projectImages'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SellerRegisterProjectDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SellerRegisterProjectDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SellerRegisterProjectDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SellerRegisterProjectDTO> mapFromJson(dynamic json) {
    final map = <String, SellerRegisterProjectDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SellerRegisterProjectDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SellerRegisterProjectDTO-objects as value to a dart map
  static Map<String, List<SellerRegisterProjectDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SellerRegisterProjectDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SellerRegisterProjectDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

