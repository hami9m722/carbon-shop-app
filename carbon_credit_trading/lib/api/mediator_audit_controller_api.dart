//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;


class MediatorAuditControllerApi {
  MediatorAuditControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'PATCH /api/mediator/audit/question/{questionId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] questionId (required):
  ///
  /// * [MediatorAnswerDTO] mediatorAnswerDTO (required):
  Future<Response> answerQuestionWithHttpInfo(int questionId, MediatorAnswerDTO mediatorAnswerDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/question/{questionId}'
      .replaceAll('{questionId}', questionId.toString());

    // ignore: prefer_final_locals
    Object? postBody = mediatorAnswerDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] questionId (required):
  ///
  /// * [MediatorAnswerDTO] mediatorAnswerDTO (required):
  Future<void> answerQuestion(int questionId, MediatorAnswerDTO mediatorAnswerDTO,) async {
    final response = await answerQuestionWithHttpInfo(questionId, mediatorAnswerDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/mediator/audit/project/{projectId}/approve' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  Future<Response> approveProjectWithHttpInfo(int projectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/project/{projectId}/approve'
      .replaceAll('{projectId}', projectId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  Future<void> approveProject(int projectId,) async {
    final response = await approveProjectWithHttpInfo(projectId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/mediator/audit/user/{userId}/approve' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] userId (required):
  Future<Response> approveUserRegistrationWithHttpInfo(int userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/user/{userId}/approve'
      .replaceAll('{userId}', userId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] userId (required):
  Future<AppUserDTO?> approveUserRegistration(int userId,) async {
    final response = await approveUserRegistrationWithHttpInfo(userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AppUserDTO',) as AppUserDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PATCH /api/mediator/audit/order/{orderId}/cancel' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] orderId (required):
  Future<Response> cancelProcessOrderWithHttpInfo(int orderId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/order/{orderId}/cancel'
      .replaceAll('{orderId}', orderId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  Future<OrderDTO?> cancelProcessOrder(int orderId,) async {
    final response = await cancelProcessOrderWithHttpInfo(orderId,);
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

  /// Performs an HTTP 'DELETE /api/mediator/audit/question/{questionId}/answer' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] questionId (required):
  Future<Response> deleteQuestionAnswerWithHttpInfo(int questionId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/question/{questionId}/answer'
      .replaceAll('{questionId}', questionId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] questionId (required):
  Future<void> deleteQuestionAnswer(int questionId,) async {
    final response = await deleteQuestionAnswerWithHttpInfo(questionId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/mediator/audit/order/{orderId}/done' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] orderId (required):
  ///
  /// * [MediatorDoneOrderDTO] mediatorDoneOrderDTO (required):
  Future<Response> doneProcessOrderWithHttpInfo(int orderId, MediatorDoneOrderDTO mediatorDoneOrderDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/order/{orderId}/done'
      .replaceAll('{orderId}', orderId.toString());

    // ignore: prefer_final_locals
    Object? postBody = mediatorDoneOrderDTO;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  ///
  /// * [MediatorDoneOrderDTO] mediatorDoneOrderDTO (required):
  Future<OrderDTO?> doneProcessOrder(int orderId, MediatorDoneOrderDTO mediatorDoneOrderDTO,) async {
    final response = await doneProcessOrderWithHttpInfo(orderId, mediatorDoneOrderDTO,);
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

  /// Performs an HTTP 'PATCH /api/mediator/audit/project/{projectId}/reject' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  Future<Response> rejectProjectWithHttpInfo(int projectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/project/{projectId}/reject'
      .replaceAll('{projectId}', projectId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  Future<void> rejectProject(int projectId,) async {
    final response = await rejectProjectWithHttpInfo(projectId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs an HTTP 'PATCH /api/mediator/audit/user/{userId}/reject' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] userId (required):
  Future<Response> rejectUserRegistrationWithHttpInfo(int userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/user/{userId}/reject'
      .replaceAll('{userId}', userId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [int] userId (required):
  Future<AppUserDTO?> rejectUserRegistration(int userId,) async {
    final response = await rejectUserRegistrationWithHttpInfo(userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AppUserDTO',) as AppUserDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PATCH /api/mediator/audit/order/{orderId}/process' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] orderId (required):
  Future<Response> startProcessOrderWithHttpInfo(int orderId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/order/{orderId}/process'
      .replaceAll('{orderId}', orderId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'PATCH',
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
  Future<OrderDTO?> startProcessOrder(int orderId,) async {
    final response = await startProcessOrderWithHttpInfo(orderId,);
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

  /// Performs an HTTP 'GET /api/mediator/audit/orders' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] status:
  Future<Response> viewAllOrderWithHttpInfo({ String? status, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/orders';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
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
  Future<PagedOrderDTO?> viewAllOrder({ String? status, }) async {
    final response = await viewAllOrderWithHttpInfo( status: status, );
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

  /// Performs an HTTP 'GET /api/mediator/audit/projects' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] status:
  ///
  /// * [String] filter:
  Future<Response> viewAllProject2WithHttpInfo({ String? status, String? filter, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/projects';

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
  Future<PagedProjectDTO?> viewAllProject2({ String? status, String? filter, }) async {
    final response = await viewAllProject2WithHttpInfo( status: status, filter: filter, );
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

  /// Performs an HTTP 'GET /api/mediator/audit/questions/init' operation and returns the [Response].
  Future<Response> viewAllQuestionWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/questions/init';

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

  Future<PagedQuestionDTO?> viewAllQuestion() async {
    final response = await viewAllQuestionWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedQuestionDTO',) as PagedQuestionDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/mediator/audit/users/init' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] status:
  Future<Response> viewAllUserWithHttpInfo({ String? status, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/users/init';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
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
  Future<PagedAppUserDTO?> viewAllUser({ String? status, }) async {
    final response = await viewAllUserWithHttpInfo( status: status, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedAppUserDTO',) as PagedAppUserDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/mediator/audit/company/{companyId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  Future<Response> viewCompany1WithHttpInfo(int companyId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/company/{companyId}'
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

  /// Performs an HTTP 'GET /api/mediator/audit/order/{orderId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] orderId (required):
  Future<Response> viewOrder1WithHttpInfo(int orderId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/order/{orderId}'
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

  /// Performs an HTTP 'GET /api/mediator/audit/project/{projectId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  Future<Response> viewProject1WithHttpInfo(int projectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/project/{projectId}'
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

  /// Performs an HTTP 'GET /api/mediator/audit/question/{questionId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] questionId (required):
  Future<Response> viewQuestionWithHttpInfo(int questionId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/question/{questionId}'
      .replaceAll('{questionId}', questionId.toString());

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
  /// * [int] questionId (required):
  Future<QuestionDTO?> viewQuestion(int questionId,) async {
    final response = await viewQuestionWithHttpInfo(questionId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuestionDTO',) as QuestionDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/mediator/audit/user/{userId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] userId (required):
  Future<Response> viewUserWithHttpInfo(int userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/mediator/audit/user/{userId}'
      .replaceAll('{userId}', userId.toString());

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
  /// * [int] userId (required):
  Future<AppUserDTO?> viewUser(int userId,) async {
    final response = await viewUserWithHttpInfo(userId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AppUserDTO',) as AppUserDTO;
    
    }
    return null;
  }
}
