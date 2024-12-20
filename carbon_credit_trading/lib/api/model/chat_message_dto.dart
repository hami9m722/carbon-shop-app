//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class ChatMessageDTO {
  /// Returns a new [ChatMessageDTO] instance.
  ChatMessageDTO({
    this.id,
    this.content,
    this.fileId,
    required this.conversationId,
    this.sender,
    this.receiver,
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
  String? content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fileId;

  String conversationId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? sender;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? receiver;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChatMessageDTO &&
    other.id == id &&
    other.content == content &&
    other.fileId == fileId &&
    other.conversationId == conversationId &&
    other.sender == sender &&
    other.receiver == receiver;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (content == null ? 0 : content!.hashCode) +
    (fileId == null ? 0 : fileId!.hashCode) +
    (conversationId.hashCode) +
    (sender == null ? 0 : sender!.hashCode) +
    (receiver == null ? 0 : receiver!.hashCode);

  @override
  String toString() => 'ChatMessageDTO[id=$id, content=$content, fileId=$fileId, conversationId=$conversationId, sender=$sender, receiver=$receiver]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
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
      json[r'conversationId'] = this.conversationId;
    if (this.sender != null) {
      json[r'sender'] = this.sender;
    } else {
      json[r'sender'] = null;
    }
    if (this.receiver != null) {
      json[r'receiver'] = this.receiver;
    } else {
      json[r'receiver'] = null;
    }
    return json;
  }

  /// Returns a new [ChatMessageDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChatMessageDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChatMessageDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChatMessageDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChatMessageDTO(
        id: mapValueOfType<int>(json, r'id'),
        content: mapValueOfType<String>(json, r'content'),
        fileId: mapValueOfType<int>(json, r'fileId'),
        conversationId: mapValueOfType<String>(json, r'conversationId')!,
        sender: mapValueOfType<int>(json, r'sender'),
        receiver: mapValueOfType<int>(json, r'receiver'),
      );
    }
    return null;
  }

  static List<ChatMessageDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChatMessageDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChatMessageDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChatMessageDTO> mapFromJson(dynamic json) {
    final map = <String, ChatMessageDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChatMessageDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChatMessageDTO-objects as value to a dart map
  static Map<String, List<ChatMessageDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChatMessageDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChatMessageDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'conversationId',
  };
}

