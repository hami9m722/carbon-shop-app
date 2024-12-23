import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/extensions/file_id.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/comment.dart';
import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/models/user.dart';
import 'package:carbon_credit_trading/services/service.dart';

extension ProjectDTOMapper on ProjectDTO {
  Future<Project> toProject() async {
    var company = await userControllerApi.viewCompany(ownerCompany!);
    var companyUser = await userControllerApi.viewCompanyUser(company!.id!);
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
      status: status?.toString().split('.').last ?? '',
      //rating: projectData.rating,
      company: company,
      companyUser: companyUser!,
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
    var buyerUser = await userControllerApi.viewUser(createdBy!);
    var buyerCompany =
        await userControllerApi.viewCompany(buyerUser?.company ?? 0);
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
      buyerCompany: buyerCompany,
      projectInfo: await project.toProject(),
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

extension ContactItemDTOMapper on ContactItemDTO {
  Future<Message> toMessage() async {
    var selfFuture = userControllerApi.viewUser(currentUserId!);
    var userFuture = userControllerApi.viewUser(chatUserId!);

    var self = await selfFuture;
    var user = await userFuture;

    return Message(
      conversationId ?? '',
      currentUserId ?? 0,
      chatUserId ?? 0,
      messageId: latestMessage?.id ?? 0,
      senderName: self?.name ?? '',
      senderAvatar: self?.avatar?.toFilePath() ?? '',
      receiverName: user?.name ?? '',
      receiverAvatar: user?.avatar?.toFilePath() ?? '',
      timestamp: latestMessage?.createdAt ?? DateTime.now(),
      isRead: false,
    );
  }
}

extension PagedContactItemDTOMapper on PagedContactItemDTO {
  Future<List<Message>> toMessages() async {
    return await Future.wait(
        content.map((contact) => contact.toMessage()).toList());
  }
}

extension ChatMessageDTOMapper on ChatMessageDTO {
  Future<Message> toMessage() async {
    var senderFuture = userControllerApi.viewUser(this.sender!);
    var receiverFuture = userControllerApi.viewUser(this.receiver!);

    var sender = await senderFuture;
    var receiver = await receiverFuture;

    return Message(
      conversationId ?? '',
      sender?.userId ?? 0,
      receiver?.userId ?? 0,
      messageId: id ?? 0,
      senderName: sender?.name ?? '',
      senderAvatar: sender?.avatar?.toFilePath() ?? '',
      receiverName: receiver?.name ?? '',
      receiverAvatar: receiver?.avatar?.toFilePath() ?? '',
      content: content,
      audioUrl: audioId?.toFilePath() ?? '',
      imageUrls: imageId != null ? [imageId!.toFilePath()] : [],
      videoUrl: videoId?.toFilePath() ?? '',
      timestamp: createdAt ?? DateTime.now(),
      isRead: false,
    );
  }
}

extension PagedChatMessageDTOMapper on PagedChatMessageDTO {
  Future<List<Message>> toMessages() async {
    return await Future.wait(
        content.map((message) => message.toMessage()).toList());
  }
}
