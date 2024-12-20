//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class ContactItemDTO {
  /// Returns a new [ContactItemDTO] instance.
  ContactItemDTO({
    this.conversationId,
    this.chatUserId,
    this.latestMessage,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? conversationId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? chatUserId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ChatMessageDTO? latestMessage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContactItemDTO &&
    other.conversationId == conversationId &&
    other.chatUserId == chatUserId &&
    other.latestMessage == latestMessage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (conversationId == null ? 0 : conversationId!.hashCode) +
    (chatUserId == null ? 0 : chatUserId!.hashCode) +
    (latestMessage == null ? 0 : latestMessage!.hashCode);

  @override
  String toString() => 'ContactItemDTO[conversationId=$conversationId, chatUserId=$chatUserId, latestMessage=$latestMessage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.conversationId != null) {
      json[r'conversationId'] = this.conversationId;
    } else {
      json[r'conversationId'] = null;
    }
    if (this.chatUserId != null) {
      json[r'chatUserId'] = this.chatUserId;
    } else {
      json[r'chatUserId'] = null;
    }
    if (this.latestMessage != null) {
      json[r'latestMessage'] = this.latestMessage;
    } else {
      json[r'latestMessage'] = null;
    }
    return json;
  }

  /// Returns a new [ContactItemDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContactItemDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContactItemDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContactItemDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContactItemDTO(
        conversationId: mapValueOfType<String>(json, r'conversationId'),
        chatUserId: mapValueOfType<int>(json, r'chatUserId'),
        latestMessage: ChatMessageDTO.fromJson(json[r'latestMessage']),
      );
    }
    return null;
  }

  static List<ContactItemDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContactItemDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContactItemDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContactItemDTO> mapFromJson(dynamic json) {
    final map = <String, ContactItemDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContactItemDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContactItemDTO-objects as value to a dart map
  static Map<String, List<ContactItemDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContactItemDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContactItemDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

