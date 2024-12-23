//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of carbon_server_apis;


class UserControllerApi {
  UserControllerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /api/user/chat/conversation/{conversationId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] conversationId (required):
  Future<Response> getConversationMessagesWithHttpInfo(String conversationId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/chat/conversation/{conversationId}'
      .replaceAll('{conversationId}', conversationId);

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
  /// * [String] conversationId (required):
  Future<PagedChatMessageDTO?> getConversationMessages(String conversationId,) async {
    final response = await getConversationMessagesWithHttpInfo(conversationId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedChatMessageDTO',) as PagedChatMessageDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/user/chat/conversations' operation and returns the [Response].
  Future<Response> getConversationsWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/chat/conversations';

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

  Future<PagedContactItemDTO?> getConversations() async {
    final response = await getConversationsWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedContactItemDTO',) as PagedContactItemDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/user/chat/conversation/{conversationId}/latest' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] conversationId (required):
  Future<Response> getLatestMessageWithHttpInfo(String conversationId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/chat/conversation/{conversationId}/latest'
      .replaceAll('{conversationId}', conversationId);

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
  /// * [String] conversationId (required):
  Future<ChatMessageDTO?> getLatestMessage(String conversationId,) async {
    final response = await getLatestMessageWithHttpInfo(conversationId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ChatMessageDTO',) as ChatMessageDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PATCH /api/user/company/review/{reviewId}/like' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] reviewId (required):
  Future<Response> likeCompanyReviewWithHttpInfo(int reviewId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/company/review/{reviewId}/like'
      .replaceAll('{reviewId}', reviewId.toString());

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
  /// * [int] reviewId (required):
  Future<LikeResultDTO?> likeCompanyReview(int reviewId,) async {
    final response = await likeCompanyReviewWithHttpInfo(reviewId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LikeResultDTO',) as LikeResultDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'PATCH /api/user/project/review/{reviewId}/like' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] reviewId (required):
  Future<Response> likeProjectReviewWithHttpInfo(int reviewId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/project/review/{reviewId}/like'
      .replaceAll('{reviewId}', reviewId.toString());

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
  /// * [int] reviewId (required):
  Future<LikeResultDTO?> likeProjectReview(int reviewId,) async {
    final response = await likeProjectReviewWithHttpInfo(reviewId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LikeResultDTO',) as LikeResultDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /api/user/question' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [UserAskDTO] userAskDTO (required):
  Future<Response> newQuestionWithHttpInfo(UserAskDTO userAskDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/question';

    // ignore: prefer_final_locals
    Object? postBody = userAskDTO;

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
  /// * [UserAskDTO] userAskDTO (required):
  Future<QuestionDTO?> newQuestion(UserAskDTO userAskDTO,) async {
    final response = await newQuestionWithHttpInfo(userAskDTO,);
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

  /// Performs an HTTP 'POST /api/user/chat' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [SendChatMessageDTO] sendChatMessageDTO (required):
  Future<Response> sendMessageWithHttpInfo(SendChatMessageDTO sendChatMessageDTO,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/chat';

    // ignore: prefer_final_locals
    Object? postBody = sendChatMessageDTO;

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
  /// * [SendChatMessageDTO] sendChatMessageDTO (required):
  Future<ChatMessageDTO?> sendMessage(SendChatMessageDTO sendChatMessageDTO,) async {
    final response = await sendMessageWithHttpInfo(sendChatMessageDTO,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ChatMessageDTO',) as ChatMessageDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/user/projects' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] filter:
  Future<Response> viewAllProjectWithHttpInfo({ String? filter, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/projects';

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
  Future<PagedProjectDTO?> viewAllProject({ String? filter, }) async {
    final response = await viewAllProjectWithHttpInfo( filter: filter, );
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

  /// Performs an HTTP 'GET /api/user/company/{companyId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  Future<Response> viewCompanyWithHttpInfo(int companyId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/company/{companyId}'
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
  Future<CompanyDTO?> viewCompany(int companyId,) async {
    final response = await viewCompanyWithHttpInfo(companyId,);
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

  /// Performs an HTTP 'GET /api/user/company/{companyId}/reviews' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  Future<Response> viewCompanyReviewsWithHttpInfo(int companyId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/company/{companyId}/reviews'
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
  Future<PagedCompanyReviewDTO?> viewCompanyReviews(int companyId,) async {
    final response = await viewCompanyReviewsWithHttpInfo(companyId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedCompanyReviewDTO',) as PagedCompanyReviewDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/user/company/{companyId}/user' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] companyId (required):
  Future<Response> viewCompanyUserWithHttpInfo(int companyId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/company/{companyId}/user'
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
  Future<AppUserDTO?> viewCompanyUser(int companyId,) async {
    final response = await viewCompanyUserWithHttpInfo(companyId,);
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

  /// Performs an HTTP 'GET /api/user/project/{projectId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  Future<Response> viewProjectWithHttpInfo(int projectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/project/{projectId}'
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

  /// Performs an HTTP 'GET /api/user/project/{projectId}/reviews' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] projectId (required):
  Future<Response> viewProjectReviewsWithHttpInfo(int projectId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/project/{projectId}/reviews'
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
  Future<PagedProjectReviewDTO?> viewProjectReviews(int projectId,) async {
    final response = await viewProjectReviewsWithHttpInfo(projectId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PagedProjectReviewDTO',) as PagedProjectReviewDTO;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /api/user/questions' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [bool] self:
  ///
  /// * [bool] answered:
  Future<Response> viewQuestionsWithHttpInfo({ bool? self, bool? answered, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/questions';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (self != null) {
      queryParams.addAll(_queryParams('', 'self', self));
    }
    if (answered != null) {
      queryParams.addAll(_queryParams('', 'answered', answered));
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
  /// * [bool] self:
  ///
  /// * [bool] answered:
  Future<PagedQuestionDTO?> viewQuestions({ bool? self, bool? answered, }) async {
    final response = await viewQuestionsWithHttpInfo( self: self, answered: answered, );
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

  /// Performs an HTTP 'GET /api/user/{userId}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [int] userId (required):
  Future<Response> viewUserWithHttpInfo(int userId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/user/{userId}'
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
