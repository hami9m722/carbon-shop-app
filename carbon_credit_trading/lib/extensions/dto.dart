import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/models/comment.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/models/user.dart';
import 'package:carbon_credit_trading/services/service.dart';

extension ProjectDTOMapper on ProjectDTO {
  Project toProject() {
    return Project(
      projectId: projectId ?? 0,
      projectName: name ?? '',
      startDate: timeStart?.year.toString() ?? DateTime.now().year.toString(),
      endDate: timeEnd?.year.toString() ?? DateTime.now().year.toString(),
      location: address ?? '',
      scale: size ?? '',
      scope: produceCarbonRate ?? '',
      partners: partner ?? '',
      issuer: auditByOrg ?? '',
      availableCredits: (creditAmount != null) ? creditAmount.toString() : '0',
      certificates: cert ?? '',
      price: price ?? '0',
      projectImages: projectImages,
      //creditImages: List<String>.from(projectData.creditImages ?? []),
      paymentMethods: List<String>.from(methodPayment?.split(',') ?? []),
      //status: projectData.status ?? '',
      //rating: projectData.rating,
    );
  }
}

extension ProjectReviewDTOMapper on ProjectReviewDTO {
  Future<Comment> toComment() async {
    var user = await userControllerApi.viewUser(reviewBy!);
    return Comment(
      userName: user?.name ?? '',
      userImage: '',
      date: DateTime.timestamp().toString(),
      review: message ?? '',
      images: [],
      rating: rate ?? 0,
    );
  }
}

extension AppUserDTOMapper on AppUserDTO {
  User toUser() {
    return User(
      businessName: name ?? '',
      email: email ?? '',
      image: '',
      isInChat: false,
    );
  }
}

extension OrderDTOMapper on OrderDTO {
  Future<Transaction> toTransaction() async {
    var project = await userControllerApi.viewProject(this.project!);
    var ownerCompany =
        await userControllerApi.viewCompany(project!.ownerCompany!);
    var ownerCompanyUser =
        await userControllerApi.viewCompanyUser(ownerCompany!.id!);
    var buyerUser = await userControllerApi.viewCompanyUser(createdBy!);
    return Transaction(
      this,
      transactionId: orderId ?? 0,
      contractNumber: '',
      contractDate: DateTime.timestamp().toString(),
      projectName: project.name ?? '',
      creditAmount: creditAmount.toString(),
      totalAmount: total.toString(),
      seller: ownerCompanyUser!.toUser(),
      buyer: buyerUser!.toUser(),
      projectInfo: project.toProject(),
      status: status.toString(),
    );
  }
}

extension PagedOrderDTOMapper on PagedOrderDTO {
  Future<List<Transaction>> toTransactions() async {
    return await Future.wait(
        content.map((order) => order.toTransaction()).toList());
  }
}
