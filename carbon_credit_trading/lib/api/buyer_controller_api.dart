//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of my_api_client;


class BuyerControllerApi {
  BuyerControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'POST /api/buyer/order' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [BuyerCreateOrder] buyerCreateOrder (required):
  Future<Response> newOrderWithHttpInfo(BuyerCreateOrder buyerCreateOrder,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/order';

    // ignore: prefer_final_locals
    Object? postBody = buyerCreateOrder;

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
  /// * [BuyerCreateOrder] buyerCreateOrder (required):
  Future<OrderDTO?> newOrder(BuyerCreateOrder buyerCreateOrder,) async {
    final response = await newOrderWithHttpInfo(buyerCreateOrder,);
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

  /// Performs an HTTP 'POST /api/buyer/company/{companyId}/review' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  ///
  /// * [BuyerReviewCompanyDTO] buyerReviewCompanyDTO (required):
  Future<Response> reviewCompany1WithHttpInfo(int companyId, BuyerReviewCompanyDTO buyerReviewCompanyDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/company/{companyId}/review'
      .replaceAll('{companyId}', companyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = buyerReviewCompanyDTO;

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
  /// * [BuyerReviewCompanyDTO] buyerReviewCompanyDTO (required):
  Future<void> reviewCompany1(int companyId, BuyerReviewCompanyDTO buyerReviewCompanyDTO,) async {
    final response = await reviewCompany1WithHttpInfo(companyId, buyerReviewCompanyDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'POST /api/buyer/project/{projectId}/review' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  ///
  /// * [BuyerReviewProjectDTO] buyerReviewProjectDTO (required):
  Future<Response> reviewProjectWithHttpInfo(int projectId, BuyerReviewProjectDTO buyerReviewProjectDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/project/{projectId}/review'
      .replaceAll('{projectId}', projectId.toString());

    // ignore: prefer_final_locals
    Object? postBody = buyerReviewProjectDTO;

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
  /// * [int] projectId (required):
  ///
  /// * [BuyerReviewProjectDTO] buyerReviewProjectDTO (required):
  Future<void> reviewProject(int projectId, BuyerReviewProjectDTO buyerReviewProjectDTO,) async {
    final response = await reviewProjectWithHttpInfo(projectId, buyerReviewProjectDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'GET /api/buyer/orders' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] filter:
  Future<Response> viewAllOrders1WithHttpInfo({ String? filter, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/orders';

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
  Future<PagedOrderDTO?> viewAllOrders1({ String? filter, }) async {
    final response = await viewAllOrders1WithHttpInfo( filter: filter, );
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

  /// Performs an HTTP 'GET /api/buyer/projects' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] filter:
  Future<Response> viewAllProject3WithHttpInfo({ String? filter, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/projects';

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
  Future<PagedProjectDTO?> viewAllProject3({ String? filter, }) async {
    final response = await viewAllProject3WithHttpInfo( filter: filter, );
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

  /// Performs an HTTP 'GET /api/buyer/company/{companyId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  Future<Response> viewCompany1WithHttpInfo(int companyId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/company/{companyId}'
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

  /// Performs an HTTP 'GET /api/buyer/order/{orderId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] orderId (required):
  Future<Response> viewOrder1WithHttpInfo(int orderId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/order/{orderId}'
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
  Future<OrderDTO?> viewOrder1(int orderId,) async {
    final response = await viewOrder1WithHttpInfo(orderId,);
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

  /// Performs an HTTP 'GET /api/buyer/project/{projectId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  Future<Response> viewProject1WithHttpInfo(int projectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/buyer/project/{projectId}'
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
  Future<ProjectDTO?> viewProject1(int projectId,) async {
    final response = await viewProject1WithHttpInfo(projectId,);
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
