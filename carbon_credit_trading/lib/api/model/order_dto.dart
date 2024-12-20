//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class OrderDTO {
  /// Returns a new [OrderDTO] instance.
  OrderDTO({
    this.orderId,
    this.creditAmount,
    this.unit,
    this.price,
    this.total,
    this.status,
    this.paymentBillFile,
    this.contractFile,
    this.certImages = const [],
    this.project,
    this.processBy,
    this.createdBy,
    this.contractSignDate,
    this.payDate,
    this.deliveryDate,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? orderId;

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
  String? unit;

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
  String? total;

  OrderDTOStatusEnum? status;

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
  int? contractFile;

  List<int> certImages;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? project;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? processBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? createdBy;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is OrderDTO &&
    other.orderId == orderId &&
    other.creditAmount == creditAmount &&
    other.unit == unit &&
    other.price == price &&
    other.total == total &&
    other.status == status &&
    other.paymentBillFile == paymentBillFile &&
    other.contractFile == contractFile &&
    _deepEquality.equals(other.certImages, certImages) &&
    other.project == project &&
    other.processBy == processBy &&
    other.createdBy == createdBy &&
    other.contractSignDate == contractSignDate &&
    other.payDate == payDate &&
    other.deliveryDate == deliveryDate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (orderId == null ? 0 : orderId!.hashCode) +
    (creditAmount == null ? 0 : creditAmount!.hashCode) +
    (unit == null ? 0 : unit!.hashCode) +
    (price == null ? 0 : price!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (paymentBillFile == null ? 0 : paymentBillFile!.hashCode) +
    (contractFile == null ? 0 : contractFile!.hashCode) +
    (certImages.hashCode) +
    (project == null ? 0 : project!.hashCode) +
    (processBy == null ? 0 : processBy!.hashCode) +
    (createdBy == null ? 0 : createdBy!.hashCode) +
    (contractSignDate == null ? 0 : contractSignDate!.hashCode) +
    (payDate == null ? 0 : payDate!.hashCode) +
    (deliveryDate == null ? 0 : deliveryDate!.hashCode);

  @override
  String toString() => 'OrderDTO[orderId=$orderId, creditAmount=$creditAmount, unit=$unit, price=$price, total=$total, status=$status, paymentBillFile=$paymentBillFile, contractFile=$contractFile, certImages=$certImages, project=$project, processBy=$processBy, createdBy=$createdBy, contractSignDate=$contractSignDate, payDate=$payDate, deliveryDate=$deliveryDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.orderId != null) {
      json[r'orderId'] = this.orderId;
    } else {
      json[r'orderId'] = null;
    }
    if (this.creditAmount != null) {
      json[r'creditAmount'] = this.creditAmount;
    } else {
      json[r'creditAmount'] = null;
    }
    if (this.unit != null) {
      json[r'unit'] = this.unit;
    } else {
      json[r'unit'] = null;
    }
    if (this.price != null) {
      json[r'price'] = this.price;
    } else {
      json[r'price'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.paymentBillFile != null) {
      json[r'paymentBillFile'] = this.paymentBillFile;
    } else {
      json[r'paymentBillFile'] = null;
    }
    if (this.contractFile != null) {
      json[r'contractFile'] = this.contractFile;
    } else {
      json[r'contractFile'] = null;
    }
      json[r'certImages'] = this.certImages;
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.processBy != null) {
      json[r'processBy'] = this.processBy;
    } else {
      json[r'processBy'] = null;
    }
    if (this.createdBy != null) {
      json[r'createdBy'] = this.createdBy;
    } else {
      json[r'createdBy'] = null;
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
    return json;
  }

  /// Returns a new [OrderDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static OrderDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "OrderDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "OrderDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return OrderDTO(
        orderId: mapValueOfType<int>(json, r'orderId'),
        creditAmount: mapValueOfType<int>(json, r'creditAmount'),
        unit: mapValueOfType<String>(json, r'unit'),
        price: mapValueOfType<String>(json, r'price'),
        total: mapValueOfType<String>(json, r'total'),
        status: OrderDTOStatusEnum.fromJson(json[r'status']),
        paymentBillFile: mapValueOfType<int>(json, r'paymentBillFile'),
        contractFile: mapValueOfType<int>(json, r'contractFile'),
        certImages: json[r'certImages'] is Iterable
            ? (json[r'certImages'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        project: mapValueOfType<int>(json, r'project'),
        processBy: mapValueOfType<int>(json, r'processBy'),
        createdBy: mapValueOfType<int>(json, r'createdBy'),
        contractSignDate: mapDateTime(json, r'contractSignDate', r''),
        payDate: mapDateTime(json, r'payDate', r''),
        deliveryDate: mapDateTime(json, r'deliveryDate', r''),
      );
    }
    return null;
  }

  static List<OrderDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, OrderDTO> mapFromJson(dynamic json) {
    final map = <String, OrderDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = OrderDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of OrderDTO-objects as value to a dart map
  static Map<String, List<OrderDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<OrderDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = OrderDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class OrderDTOStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const OrderDTOStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const INIT = OrderDTOStatusEnum._(r'INIT');
  static const PROCESSING = OrderDTOStatusEnum._(r'PROCESSING');
  static const CANCELLED = OrderDTOStatusEnum._(r'CANCELLED');
  static const DONE = OrderDTOStatusEnum._(r'DONE');
  static const unknownDefaultOpenApi = OrderDTOStatusEnum._(r'unknown_default_open_api');

  /// List of all possible values in this [enum][OrderDTOStatusEnum].
  static const values = <OrderDTOStatusEnum>[
    INIT,
    PROCESSING,
    CANCELLED,
    DONE,
    unknownDefaultOpenApi,
  ];

  static OrderDTOStatusEnum? fromJson(dynamic value) => OrderDTOStatusEnumTypeTransformer().decode(value);

  static List<OrderDTOStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <OrderDTOStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = OrderDTOStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [OrderDTOStatusEnum] to String,
/// and [decode] dynamic data back to [OrderDTOStatusEnum].
class OrderDTOStatusEnumTypeTransformer {
  factory OrderDTOStatusEnumTypeTransformer() => _instance ??= const OrderDTOStatusEnumTypeTransformer._();

  const OrderDTOStatusEnumTypeTransformer._();

  String encode(OrderDTOStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a OrderDTOStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  OrderDTOStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'INIT': return OrderDTOStatusEnum.INIT;
        case r'PROCESSING': return OrderDTOStatusEnum.PROCESSING;
        case r'CANCELLED': return OrderDTOStatusEnum.CANCELLED;
        case r'DONE': return OrderDTOStatusEnum.DONE;
        case r'unknown_default_open_api': return OrderDTOStatusEnum.unknownDefaultOpenApi;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [OrderDTOStatusEnumTypeTransformer] instance.
  static OrderDTOStatusEnumTypeTransformer? _instance;
}


