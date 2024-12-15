//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;


class PasswordResetResourceApi {
  PasswordResetResourceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /passwordReset/complete' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PasswordResetCompleteRequest] passwordResetCompleteRequest (required):
  Future<Response> completeWithHttpInfo(PasswordResetCompleteRequest passwordResetCompleteRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/passwordReset/complete';

    // ignore: prefer_final_locals
    Object? postBody = passwordResetCompleteRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [PasswordResetCompleteRequest] passwordResetCompleteRequest (required):
  Future<void> complete(PasswordResetCompleteRequest passwordResetCompleteRequest,) async {
    final response = await completeWithHttpInfo(passwordResetCompleteRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /passwordReset/isValidUid' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<Response> isValidUidWithHttpInfo(String uid,) async {
    // ignore: prefer_const_declarations
    final path = r'/passwordReset/isValidUid';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'uid', uid));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] uid (required):
  Future<bool?> isValidUid(String uid,) async {
    final response = await isValidUidWithHttpInfo(uid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'bool',) as bool;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /passwordReset/start' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [PasswordResetRequest] passwordResetRequest (required):
  Future<Response> startWithHttpInfo(PasswordResetRequest passwordResetRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/passwordReset/start';

    // ignore: prefer_final_locals
    Object? postBody = passwordResetRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [PasswordResetRequest] passwordResetRequest (required):
  Future<void> start(PasswordResetRequest passwordResetRequest,) async {
    final response = await startWithHttpInfo(passwordResetRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
