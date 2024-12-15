import 'package:carbon_credit_trading/api/api.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  AuthService(this._api);

  final ApiClient apiClient = ApiClient();
  final AuthenticationResourceApi _api;

  Future<AuthenticationResponse> authenticate(
      String email, String password) async {
    var response = await _api
        .authenticate(AuthenticationRequest(email: email, password: password));
    if (response == null) {
      throw Exception('Invalid credentials');
    }

    var httpBearerAuth = HttpBearerAuth();
    httpBearerAuth.accessToken = response.accessToken;
    apiClient.authentication = httpBearerAuth;
    if (kDebugMode) {
      print('Authenticated got token = ${response.accessToken}');
    }

    return response;
  }
}
