//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;


class FileControllerApi {
  FileControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/file/{fileId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] fileId (required):
  Future<Response> callGetWithHttpInfo(int fileId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/file/{fileId}'
      .replaceAll('{fileId}', fileId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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
  /// * [int] fileId (required):
  Future<MultipartFile?> callGet(int fileId,) async {
    final response = await callGetWithHttpInfo(fileId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultipartFile',) as MultipartFile;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/file/upload' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UploadRequest] uploadRequest:
  Future<Response> uploadWithHttpInfo({ UploadRequest? uploadRequest, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/file/upload';

    // ignore: prefer_final_locals
    Object? postBody = uploadRequest;

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
  /// * [UploadRequest] uploadRequest:
  Future<void> upload({ UploadRequest? uploadRequest, }) async {
    final response = await uploadWithHttpInfo( uploadRequest: uploadRequest, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
