import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:flutter/foundation.dart';

class AuthService {

  Future<AuthenticationResponse> authenticate(
      String email, String password) async {
    var response = await authenticationResourceApi
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

    currentUserId = response.user?.userId!;

    return response;
  }
}
