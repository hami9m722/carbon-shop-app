import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/extensions/file_id.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/pages/chat_page.dart';
import 'package:carbon_credit_trading/pages/feedback_page.dart';
import 'package:carbon_credit_trading/pages/project_registration_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:carbon_credit_trading/widgets/full_screen_view.dart';
import 'package:carbon_credit_trading/widgets/image_carousel.dart';
import 'package:carbon_credit_trading/widgets/purchase_dialog.dart';
import 'package:flutter/material.dart';

/* /*Description
  project info(
    projectImages,

    projectName
      startDate
      endDate
      address,
      size,
      produceCarbonRate,
      partners: _partnersController.text,
      ownedBy
      creditNumber,
      cert
      price
      paymentMethods list 
  )
*/
)*/

class ProjectDetailPage extends StatefulWidget {
  final String previousPage;
  final Project project;
  final VoidCallback onChanged;

  const ProjectDetailPage(
      {super.key, this.previousPage = '', required this.project, required this.onChanged});

  @override
  createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  void showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PurchaseDialog(
          maxQuantity: widget.project.availableCredits != null
              ? int.parse(widget.project.availableCredits.toString())
              : 0,
          pricePerUnit: widget.project.price != null
              ? double.parse(widget.project.price.toString())
              : 0,
          onPurchase: (double price, int quantity) async {
            try {
              await buyerControllerApi.newOrder(BuyerCreateOrder(
                  projectId: widget.project.projectId!,
                  creditAmount: quantity));
              Navigator.of(context).pop();
            } catch (e) {
              print('Error: $e');
            }
          },
        );
      },
    );
  }

  void saveFavoriteProject() async {}

  @override
  Widget build(BuildContext context) {
    var projectId = widget.project.projectId;
    List<String> imagePaths = widget.project.projectImages
        .map((image) => image.toFilePath())
        .toList();
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Chi tiết dự án",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image carousel
                  ImageCarousel(
                    imagePaths: imagePaths,
                    onImageTap: (context, images, index) {
                      showFullScreen(context, images, index);
                    },
                  ),
                  const SizedBox(height: 25),

                  const Text(
                    'Thông tin dự án:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  customRichText(
                      title: 'Tên dự án: ', value: widget.project.projectName),
                  customRichText(
                      title: 'Vị trí: ', value: widget.project.location),
                  customRichText(
                      title: 'Quy mô: ', value: widget.project.scale),
                  customRichText(
                      title: 'Thời gian: ',
                      value:
                          '${widget.project.startDate} - ${widget.project.endDate}'),
                  customRichText(
                      title: 'Phạm vi: ', value: widget.project.scope),
                  customRichText(
                      title: 'Số lượng cần bán: ',
                      value: widget.project.availableCredits),
                  const SizedBox(height: 25),

                  const Text(
                    'Chứng chỉ carbon:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  customRichText(
                      title: 'Tiêu chuẩn tín chỉ: ',
                      value: widget.project.certificates),
                  customRichText(
                      title: 'Thời gian hiệu lực: ',
                      value: 'Vĩnh viễn (sau khi đã giao dịch)'),
                  customRichText(
                      title: 'Đối tác: ', value: widget.project.partners),
                  const SizedBox(height: 25),

                  const Text(
                    'Thông tin chi tiết:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  customRichText(
                      title: '• Giá bán: ',
                      value: "${widget.project.price} USD"),
                  customRichText(
                    title: '• Phương thức thanh toán: ',
                    value: widget.project.paymentMethods.join(', '),
                  ),
                  const SizedBox(height: 25),

                  const Text(
                    'Doanh nghiệp bảo trợ:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.project.issuer,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.greenButton,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (widget.previousPage == '')
                    businessOption == BusinessOption.buyer
                        ? // check userID != sellerCompany
                        buildBuyerUI()
                        : widget.project.status == 'PENDING'
                            ? buildPendingUI(context)
                            : Align(
                                alignment: Alignment.bottomRight,
                                child: widget.project.status == 'APPROVED'
                                    ? widget.project.companyUser?.userId ==
                                            currentUserId
                                        ? Container(
                                            decoration: const BoxDecoration(
                                              color: AppColors.greenButton,
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.archive,
                                                  color: Colors.white),
                                              onPressed: () {},
                                            ),
                                          )
                                        : const SizedBox()
                                    : widget.project.status == 'REJECTED'
                                        ? Container(
                                            decoration: const BoxDecoration(
                                              color: AppColors.greenButton,
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.replay,
                                                  color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ProjectRegistrationPage()));
                                              },
                                            ),
                                          )
                                        : const SizedBox()),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            businessOption == BusinessOption.mediator
                ? buildMediatorFooter()
                : businessOption == BusinessOption.buyer
                    ? buildBuyerFooter(context, projectId)
                    : const SizedBox()
          ],
        ),
      ),
    );
  }

  Padding buildBuyerFooter(BuildContext context, int? projectId) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeedbackPage(
                    projectId: projectId!,
                  ),
                ),
              )
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.greenButton,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              'Xem đánh giá',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ));
  }

  Padding buildMediatorFooter() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () async {
                  await mediatorAuditControllerApi
                      .rejectProject(widget.project.projectId!);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Từ chối',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () async {
                  await mediatorAuditControllerApi
                      .approveProject(widget.project.projectId!);
                  widget.onChanged.call();
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.greenButton,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Duyệt',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Row buildPendingUI(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.greenButton,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProjectRegistrationPage(
                            initialProject: widget.project,
                          )));
            },
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.greenButton,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Row buildBuyerUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.greenButton,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.message_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                      chatWithUserId: widget.project.companyUser!.userId!,
                      chatWithUserName: widget.project.companyUser!.name!,
                      chatWithUserAvatar: widget.project.companyUser!.avatar!.toFilePath()),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.greenButton,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.greenButton,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: showPurchaseDialog,
          ),
        ),
      ],
    );
  }
}
