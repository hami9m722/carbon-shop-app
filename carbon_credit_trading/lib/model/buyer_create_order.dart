//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;

class BuyerCreateOrder {
  /// Returns a new [BuyerCreateOrder] instance.
  BuyerCreateOrder({
    this.projectId,
    this.creditAmount,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? creditAmount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuyerCreateOrder &&
    other.projectId == projectId &&
    other.creditAmount == creditAmount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId == null ? 0 : projectId!.hashCode) +
    (creditAmount == null ? 0 : creditAmount!.hashCode);

  @override
  String toString() => 'BuyerCreateOrder[projectId=$projectId, creditAmount=$creditAmount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.creditAmount != null) {
      json[r'creditAmount'] = this.creditAmount;
    } else {
      json[r'creditAmount'] = null;
    }
    return json;
  }

  /// Returns a new [BuyerCreateOrder] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuyerCreateOrder? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BuyerCreateOrder[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BuyerCreateOrder[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BuyerCreateOrder(
        projectId: mapValueOfType<int>(json, r'projectId'),
        creditAmount: mapValueOfType<int>(json, r'creditAmount'),
      );
    }
    return null;
  }

  static List<BuyerCreateOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuyerCreateOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuyerCreateOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuyerCreateOrder> mapFromJson(dynamic json) {
    final map = <String, BuyerCreateOrder>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuyerCreateOrder.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuyerCreateOrder-objects as value to a dart map
  static Map<String, List<BuyerCreateOrder>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuyerCreateOrder>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuyerCreateOrder.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

