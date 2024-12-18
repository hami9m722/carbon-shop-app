import 'package:carbon_credit_trading/api/api.dart';

enum BusinessOption { none, seller, buyer, mediator }

BusinessOption businessOption = BusinessOption.none;
int? currentUserId;