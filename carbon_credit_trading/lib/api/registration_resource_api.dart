//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;


class RegistrationResourceApi {
  RegistrationResourceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /register' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [RegistrationRequest] registrationRequest (required):
  Future<Response> registerWithHttpInfo(RegistrationRequest registrationRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/register';

    // ignore: prefer_final_locals
    Object? postBody = registrationRequest;

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
  /// * [RegistrationRequest] registrationRequest (required):
  Future<void> register(RegistrationRequest registrationRequest,) async {
    final response = await registerWithHttpInfo(registrationRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
