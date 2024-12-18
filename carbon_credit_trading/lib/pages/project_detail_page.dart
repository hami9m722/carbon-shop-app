import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/pages/feedback_page.dart';
import 'package:carbon_credit_trading/pages/project_registration_page.dart';
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
  const ProjectDetailPage(
      {super.key, this.previousPage = '', required this.project});

  @override
  createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  final int maxQuantity = 20;
  final double pricePerUnit = 1000000.0;

  final List<String> _imagePaths = [
    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
    '/path/to/local/image2.jpg',
  ];

  void showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PurchaseDialog(
          maxQuantity: maxQuantity,
          pricePerUnit: pricePerUnit,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var projectId = widget.project.projectId;
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
                    imagePaths: _imagePaths,
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
                      title: 'Tên dự án: ',
                      value: 'REDD+ Bảo tồn rừng ngập mặn Thái Lan'),
                  customRichText(title: 'Vị trí: ', value: 'Vịnh Thái Lan'),
                  customRichText(title: 'Quy mô: ', value: '20,000 ha'),
                  customRichText(title: 'Thời gian: ', value: '2021 - 2041'),
                  customRichText(
                      title: 'Phạm vi: ',
                      value:
                          'Giảm 60,000 tấn CO2/năm, bảo vệ hệ sinh thái ven biển'),
                  customRichText(title: 'Số lượng cần bán: ', value: '100,000'),
                  const SizedBox(height: 25),

                  const Text(
                    'Chứng chỉ carbon:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  customRichText(
                      title: 'Tiêu chuẩn tín chỉ: ',
                      value: 'VCS (Verified Carbon Standard)'),
                  customRichText(title: 'Mã tín chỉ: ', value: 'VCS-AB123456'),
                  customRichText(
                      title: 'Ngày phát hành: ', value: '10/09/2024'),
                  customRichText(
                      title: 'Thời gian hiệu lực: ',
                      value: 'Vĩnh viễn (sau khi đã giao dịch)'),
                  customRichText(
                      title: 'Người nắm giữ tín chỉ: ',
                      value: 'Green Earth Ventures'),
                  customRichText(
                      title: 'Chứng nhận bởi: ',
                      value: 'TƯV SÜD (Tổ chức giám sát độc lập)'),
                  const SizedBox(height: 25),

                  const Text(
                    'Thông tin chi tiết:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  customRichText(
                      title: '• Tổ chức chuẩn bị: ',
                      value:
                          'TƯV SÜD đã xác minh dự án đáp ứng các tiêu chí của VCS và cấp tín chỉ carbon cho dự án này.'),
                  customRichText(
                      title: '• Công nghệ hiện tại: ',
                      value:
                          'Sử dụng công nghệ vệ tinh để theo dõi diện tích rừng và đảm bảo rừng không bị khai thác.'),
                  const SizedBox(height: 25),

                  const Text(
                    'Doanh nghiệp bảo trợ:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Renewable Biomass Energy Ventures',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greenButton),
                  ),
                  const SizedBox(height: 20),
                  if (widget.previousPage == '')
                    businessOption == 'buyer'
                        ? // check userID != sellerCompany
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.greenButton,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.message_outlined,
                                      color: Colors.white),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => const ChatPage(
                                    //         contactName:
                                    //             'Renewable Biomass Energy Ventures',
                                    //         contactAvatar: ''),
                                    //   ),
                                    // );
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
                                  icon: const Icon(Icons.favorite,
                                      color: Colors.white),
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
                                  icon: const Icon(Icons.shopping_cart,
                                      color: Colors.white),
                                  onPressed: showPurchaseDialog,
                                ),
                              ),
                            ],
                          )
                        : widget.project.status == 'pending'
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.greenButton,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.white),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProjectRegistrationPage(
                                                      initialProject:
                                                          widget.project,
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
                                      icon: const Icon(Icons.delete,
                                          color: Colors.white),
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              )
                            : Align(
                                alignment: Alignment.bottomRight,
                                child: widget.project.status == 'approved'
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
                                    : widget.project.status == 'canceled'
                                        ? Container(
                                            decoration: const BoxDecoration(
                                              color: AppColors.greenButton,
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.replay,
                                                  color: Colors.white),
                                              onPressed: () {},
                                            ),
                                          )
                                        : const SizedBox()),

                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            widget.previousPage == 'intermediary' // can check by user type
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Handle project rejection logic here
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Handle project approval logic here
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FeedbackPage(projectId: projectId!,),
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
                    ))
          ],
        ),
      ),
    );
  }
}
