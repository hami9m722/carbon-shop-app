class Project {
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
  final List<dynamic> projectImages;
  final List<dynamic> creditImages;
  final List<String> paymentMethods;
  final String? status;
  final String? rating;

  Project(
      {required this.projectName,
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
      this.projectImages = const [],
      this.creditImages = const [],
      this.paymentMethods = const [],
      this.status,
      this.rating});
}
