//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class SendChatMessageDTO {
  /// Returns a new [SendChatMessageDTO] instance.
  SendChatMessageDTO({
    this.content,
    this.fileId,
    this.receiver,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fileId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? receiver;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SendChatMessageDTO &&
    other.content == content &&
    other.fileId == fileId &&
    other.receiver == receiver;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (content == null ? 0 : content!.hashCode) +
    (fileId == null ? 0 : fileId!.hashCode) +
    (receiver == null ? 0 : receiver!.hashCode);

  @override
  String toString() => 'SendChatMessageDTO[content=$content, fileId=$fileId, receiver=$receiver]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.content != null) {
      json[r'content'] = this.content;
    } else {
      json[r'content'] = null;
    }
    if (this.fileId != null) {
      json[r'fileId'] = this.fileId;
    } else {
      json[r'fileId'] = null;
    }
    if (this.receiver != null) {
      json[r'receiver'] = this.receiver;
    } else {
      json[r'receiver'] = null;
    }
    return json;
  }

  /// Returns a new [SendChatMessageDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SendChatMessageDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SendChatMessageDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SendChatMessageDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SendChatMessageDTO(
        content: mapValueOfType<String>(json, r'content'),
        fileId: mapValueOfType<int>(json, r'fileId'),
        receiver: mapValueOfType<int>(json, r'receiver'),
      );
    }
    return null;
  }

  static List<SendChatMessageDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SendChatMessageDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SendChatMessageDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SendChatMessageDTO> mapFromJson(dynamic json) {
    final map = <String, SendChatMessageDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SendChatMessageDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SendChatMessageDTO-objects as value to a dart map
  static Map<String, List<SendChatMessageDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SendChatMessageDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SendChatMessageDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

