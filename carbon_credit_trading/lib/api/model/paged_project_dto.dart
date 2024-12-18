//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;

class PagedProjectDTO {
  /// Returns a new [PagedProjectDTO] instance.
  PagedProjectDTO({
    this.size,
    this.content = const [],
    this.number,
    this.sort,
    this.first,
    this.last,
    this.numberOfElements,
    this.pageable,
    this.totalElements,
    this.totalPages,
    this.empty,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  List<ProjectDTO> content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? number;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SortObject? sort;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? first;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? last;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? numberOfElements;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PageableObject? pageable;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalElements;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalPages;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? empty;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PagedProjectDTO &&
    other.size == size &&
    _deepEquality.equals(other.content, content) &&
    other.number == number &&
    other.sort == sort &&
    other.first == first &&
    other.last == last &&
    other.numberOfElements == numberOfElements &&
    other.pageable == pageable &&
    other.totalElements == totalElements &&
    other.totalPages == totalPages &&
    other.empty == empty;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (size == null ? 0 : size!.hashCode) +
    (content.hashCode) +
    (number == null ? 0 : number!.hashCode) +
    (sort == null ? 0 : sort!.hashCode) +
    (first == null ? 0 : first!.hashCode) +
    (last == null ? 0 : last!.hashCode) +
    (numberOfElements == null ? 0 : numberOfElements!.hashCode) +
    (pageable == null ? 0 : pageable!.hashCode) +
    (totalElements == null ? 0 : totalElements!.hashCode) +
    (totalPages == null ? 0 : totalPages!.hashCode) +
    (empty == null ? 0 : empty!.hashCode);

  @override
  String toString() => 'PagedProjectDTO[size=$size, content=$content, number=$number, sort=$sort, first=$first, last=$last, numberOfElements=$numberOfElements, pageable=$pageable, totalElements=$totalElements, totalPages=$totalPages, empty=$empty]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
      json[r'content'] = this.content;
    if (this.number != null) {
      json[r'number'] = this.number;
    } else {
      json[r'number'] = null;
    }
    if (this.sort != null) {
      json[r'sort'] = this.sort;
    } else {
      json[r'sort'] = null;
    }
    if (this.first != null) {
      json[r'first'] = this.first;
    } else {
      json[r'first'] = null;
    }
    if (this.last != null) {
      json[r'last'] = this.last;
    } else {
      json[r'last'] = null;
    }
    if (this.numberOfElements != null) {
      json[r'numberOfElements'] = this.numberOfElements;
    } else {
      json[r'numberOfElements'] = null;
    }
    if (this.pageable != null) {
      json[r'pageable'] = this.pageable;
    } else {
      json[r'pageable'] = null;
    }
    if (this.totalElements != null) {
      json[r'totalElements'] = this.totalElements;
    } else {
      json[r'totalElements'] = null;
    }
    if (this.totalPages != null) {
      json[r'totalPages'] = this.totalPages;
    } else {
      json[r'totalPages'] = null;
    }
    if (this.empty != null) {
      json[r'empty'] = this.empty;
    } else {
      json[r'empty'] = null;
    }
    return json;
  }

  /// Returns a new [PagedProjectDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PagedProjectDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PagedProjectDTO[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PagedProjectDTO[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PagedProjectDTO(
        size: mapValueOfType<int>(json, r'size'),
        content: ProjectDTO.listFromJson(json[r'content']),
        number: mapValueOfType<int>(json, r'number'),
        sort: SortObject.fromJson(json[r'sort']),
        first: mapValueOfType<bool>(json, r'first'),
        last: mapValueOfType<bool>(json, r'last'),
        numberOfElements: mapValueOfType<int>(json, r'numberOfElements'),
        pageable: PageableObject.fromJson(json[r'pageable']),
        totalElements: mapValueOfType<int>(json, r'totalElements'),
        totalPages: mapValueOfType<int>(json, r'totalPages'),
        empty: mapValueOfType<bool>(json, r'empty'),
      );
    }
    return null;
  }

  static List<PagedProjectDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PagedProjectDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PagedProjectDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PagedProjectDTO> mapFromJson(dynamic json) {
    final map = <String, PagedProjectDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PagedProjectDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PagedProjectDTO-objects as value to a dart map
  static Map<String, List<PagedProjectDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PagedProjectDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PagedProjectDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

