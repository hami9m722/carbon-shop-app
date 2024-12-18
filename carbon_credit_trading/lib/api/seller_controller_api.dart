//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;


class SellerControllerApi {
  SellerControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/seller/project' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [SellerRegisterProjectDTO] sellerRegisterProjectDTO (required):
  Future<Response> registerProjectWithHttpInfo(SellerRegisterProjectDTO sellerRegisterProjectDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/seller/project';

    // ignore: prefer_final_locals
    Object? postBody = sellerRegisterProjectDTO;

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
  /// * [SellerRegisterProjectDTO] sellerRegisterProjectDTO (required):
  Future<ProjectDTO?> registerProject(SellerRegisterProjectDTO sellerRegisterProjectDTO,) async {
    final response = await registerProjectWithHttpInfo(sellerRegisterProjectDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectDTO',) as ProjectDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/seller/company/{companyId}/review' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  ///
  /// * [SellerReviewCompany] sellerReviewCompany (required):
  Future<Response> reviewCompanyWithHttpInfo(int companyId, SellerReviewCompany sellerReviewCompany,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/seller/company/{companyId}/review'
      .replaceAll('{companyId}', companyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = sellerReviewCompany;

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
  /// * [int] companyId (required):
  ///
  /// * [SellerReviewCompany] sellerReviewCompany (required):
  Future<void> reviewCompany(int companyId, SellerReviewCompany sellerReviewCompany,) async {
    final response = await reviewCompanyWithHttpInfo(companyId, sellerReviewCompany,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/seller/orders' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] status:
  ///
  /// * [String] filter:
  Future<Response> viewAllOrdersWithHttpInfo({ String? status, String? filter, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/seller/orders';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'filter', filter));
    }

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
  /// * [String] status:
  ///
  /// * [String] filter:
  Future<PagedOrderDTO?> viewAllOrders({ String? status, String? filter, }) async {
    final response = await viewAllOrdersWithHttpInfo( status: status, filter: filter, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedOrderDTO',) as PagedOrderDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/seller/projects' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] filter:
  Future<Response> viewAllProject1WithHttpInfo({ String? filter, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/seller/projects';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (filter != null) {
      queryParams.addAll(_queryParams('', 'filter', filter));
    }

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
  /// * [String] filter:
  Future<PagedProjectDTO?> viewAllProject1({ String? filter, }) async {
    final response = await viewAllProject1WithHttpInfo( filter: filter, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedProjectDTO',) as PagedProjectDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/seller/company/{companyId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  Future<Response> viewCompany1WithHttpInfo(int companyId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/seller/company/{companyId}'
      .replaceAll('{companyId}', companyId.toString());

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
  /// * [int] companyId (required):
  Future<CompanyDTO?> viewCompany1(int companyId,) async {
    final response = await viewCompany1WithHttpInfo(companyId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CompanyDTO',) as CompanyDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/seller/order/{orderId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] orderId (required):
  Future<Response> viewOrderWithHttpInfo(int orderId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/seller/order/{orderId}'
      .replaceAll('{orderId}', orderId.toString());

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
  /// * [int] orderId (required):
  Future<OrderDTO?> viewOrder(int orderId,) async {
    final response = await viewOrderWithHttpInfo(orderId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OrderDTO',) as OrderDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/seller/project/{projectId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  Future<Response> viewProjectWithHttpInfo(int projectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/seller/project/{projectId}'
      .replaceAll('{projectId}', projectId.toString());

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
  /// * [int] projectId (required):
  Future<ProjectDTO?> viewProject(int projectId,) async {
    final response = await viewProjectWithHttpInfo(projectId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectDTO',) as ProjectDTO;
    
    }
    return null;
  }
}
