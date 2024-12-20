import 'package:carbon_credit_trading/api/api.dart';

class Project {
  final int? projectId;
  final String projectName;
  final String startDate;
  final String endDate;
  final String location;
  final String scale;
  final String scope;
  final String partners;
  final String issuer;
  final String availableCredits;
  final String certificates;
  final String price;
  final List<int> projectImages;
  final List<int> creditImages;
  final List<String> paymentMethods;
  final String? status;
  final String? rating;
  final CompanyDTO? company;
  final AppUserDTO? companyUser;

  Project(
      {this.projectId,
      required this.projectName,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.scale,
      required this.scope,
      required this.partners,
      required this.issuer,
      required this.availableCredits,
      required this.certificates,
      required this.price,
      required this.company,
      required this.companyUser,
      this.projectImages = const [],
      this.creditImages = const [],
      this.paymentMethods = const [],
      this.status,
      this.rating});
}
