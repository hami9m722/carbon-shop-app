//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library carbon_server_apis;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'authentication_resource_api.dart';
part 'buyer_controller_api.dart';
part 'file_controller_api.dart';
part 'mediator_audit_controller_api.dart';
part 'password_reset_resource_api.dart';
part 'registration_resource_api.dart';
part 'seller_controller_api.dart';
part 'user_controller_api.dart';

part 'model/api_error_response.dart';
part 'model/api_field_error.dart';
part 'model/app_user_dto.dart';
part 'model/authentication_request.dart';
part 'model/authentication_response.dart';
part 'model/buyer_create_order.dart';
part 'model/buyer_review_company_dto.dart';
part 'model/buyer_review_project_dto.dart';
part 'model/company_dto.dart';
part 'model/mediator_answer_dto.dart';
part 'model/order_dto.dart';
part 'model/pageable_object.dart';
part 'model/paged_app_user_dto.dart';
part 'model/paged_order_dto.dart';
part 'model/paged_project_dto.dart';
part 'model/paged_question_dto.dart';
part 'model/password_reset_complete_request.dart';
part 'model/password_reset_request.dart';
part 'model/project_dto.dart';
part 'model/question_dto.dart';
part 'model/seller_register_project_dto.dart';
part 'model/seller_review_company.dart';
part 'model/sort_object.dart';
part 'model/upload_request.dart';
part 'model/user_ask_dto.dart';
part 'model/user_registration_request.dart';
part 'model/mediator_done_order_dto.dart';
part 'model/company_review_dto.dart';
part 'model/paged_company_review_dto.dart';
part 'model/project_review_dto.dart';
part 'model/paged_project_review_dto.dart';
part 'model/chat_message_dto.dart';
part 'model/paged_chat_message_dto.dart';
part 'model/paged_uuiddto.dart';
part 'model/like_result_dto.dart';
part 'model/send_chat_message_dto.dart';


/// An [ApiClient] instance that uses the default values obtained from
/// the OpenAPI specification file.
var defaultApiClient = ApiClient();

const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
const _deepEquality = DeepCollectionEquality();
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
