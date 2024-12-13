import 'package:carbon_credit_trading/api.dart';
import 'package:carbon_credit_trading/services/transaction_service.dart';
import 'package:carbon_credit_trading/services/user_service.dart';

ApiClient apiClient = ApiClient();
AuthenticationResourceApi authenticationResourceApi =
    AuthenticationResourceApi(apiClient);
BuyerControllerApi buyerControllerApi = BuyerControllerApi(apiClient);
FileControllerApi fileControllerApi = FileControllerApi(apiClient);
MediatorAuditControllerApi mediatorAuditControllerApi =
    MediatorAuditControllerApi(apiClient);
PasswordResetResourceApi passwordResetResourceApi =
    PasswordResetResourceApi(apiClient);
RegistrationResourceApi registrationResourceApi =
    RegistrationResourceApi(apiClient);
SellerControllerApi sellerControllerApi = SellerControllerApi(apiClient);
UserControllerApi userControllerApi = UserControllerApi(apiClient);

UserService userService = UserService();
TransactionService transactionService = TransactionService();
