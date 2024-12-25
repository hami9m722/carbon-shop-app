import 'package:carbon_credit_trading/extensions/datetime.dart';
import 'package:carbon_credit_trading/extensions/file_id.dart';
import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/pages/add_feedback_page.dart';
import 'package:carbon_credit_trading/pages/project_detail_page.dart';
import 'package:carbon_credit_trading/pages/transaction_feedback_page.dart';
import 'package:carbon_credit_trading/services/utils.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:carbon_credit_trading/widgets/full_screen_view.dart';
import 'package:carbon_credit_trading/widgets/image_carousel.dart';
import 'package:flutter/material.dart';

//
/*Description
  field to show: date create order, date approve transaction, date pay transaction, date deliver credits
                  seller company (name, address, taxCode)
                   buyer company (name, address, taxCode)
                  project info (name, address, size, timeStart, timeEnd, produceCarbonRate)
 contract file
 bill images,
 credit images,


*/

class TransactionDetailPage extends StatefulWidget {
  final Transaction transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  @override
  Widget build(BuildContext context) {
    String transactionStatusMessage =
        getTransactionStatusMessage(widget.transaction.status);

    String billImage =
        widget.transaction.rootDto.paymentBillFile?.toFilePath() ?? '';

    final List<String> creditImages = widget.transaction.rootDto.certImages
        .map((e) => e.toFilePath())
        .toList();

    return Scaffold(
        appBar: const CustomAppBar(title: "Chi tiết giao dịch"),
        body: SafeArea(
            child: Container(
          color: AppColors.greyBackGround,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.green,
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Giao dịch ${widget.transaction.transactionId} $transactionStatusMessage',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ngày ký hợp đồng: ${widget.transaction.rootDto.contractSignDate?.toDateString() ?? 'N/A'}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Ngày tạo đơn: ${widget.transaction.rootDto.payDate?.toDateString() ?? 'N/A'}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Ngày tạo đơn: ${widget.transaction.rootDto.deliveryDate?.toDateString() ?? 'N/A'}',
                            style: AppTextStyles.normalText,
                          ),
                        ])),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Doanh nghiệp mua',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tên doanh nghiệp: ${widget.transaction.buyerCompany?.name}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Mã số thuế: ${widget.transaction.buyerCompany?.taxCode}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Địa chỉ: ${widget.transaction.buyerCompany?.address}',
                            style: AppTextStyles.normalText,
                          ),
                        ])),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Doanh nghiệp bán',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tên doanh nghiệp: ${widget.transaction.projectInfo.company?.name}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Mã số thuế: ${widget.transaction.projectInfo.company?.taxCode}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Địa chỉ: ${widget.transaction.projectInfo.company?.address}',
                            style: AppTextStyles.normalText,
                          ),
                        ])),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Thông tin dự án',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tên dự án: ${widget.transaction.projectName}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Vị trí: ${widget.transaction.projectInfo.location}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Quy mô:  ${widget.transaction.projectInfo.scale}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Thời gian:  ${widget.transaction.projectInfo.startDate} - ${widget.transaction.projectInfo.endDate}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Phạm vi: ${widget.transaction.projectInfo.scope}',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Số lượng cần bán: ${widget.transaction.projectInfo.availableCredits}',
                            style: AppTextStyles.normalText,
                          ),
                        ])),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0),
                          customRichText(
                              title: "Hợp đồng",
                              value: "Đã ký",
                              valueColor: Colors.red,
                              valueWeight: FontWeight.bold),
                          const SizedBox(height: 10.0),
                          Center(
                            // Centering the button
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greenButton,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(widget
                                  .transaction.rootDto.paymentBillFile!
                                  .toFilePath()),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          const Text(
                            'Hóa đơn thanh toán',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                              constraints: const BoxConstraints(minHeight: 130),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: billImage != null
                                    ? DecorationImage(
                                        image: NetworkImage(billImage),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              )),
                          const SizedBox(height: 15.0),
                          const Text(
                            'Hình ảnh tín chỉ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          ImageCarousel(
                            imagePaths: creditImages,
                            onImageTap: (context, images, index) {
                              showFullScreen(context, images, index);
                            },
                          ),
                          if (!(businessOption == BusinessOption.seller &&
                              widget.transaction.status == 'CANCELLED'))
                            Column(children: [
                              const SizedBox(height: 20),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TextButton(
                                  onPressed: () {
                                    if (widget.transaction.status ==
                                        'PENDING') {
                                    } else if (widget.transaction.status ==
                                        'DONE') {
                                      if (businessOption ==
                                          BusinessOption.buyer) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AddFeedbackPage(),
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TransactionFeedbackPage(),
                                          ),
                                        );
                                      }
                                    } else if (widget.transaction.status ==
                                        'CANCELLED') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProjectDetailPage(
                                            project:
                                                widget.transaction.projectInfo,
                                            onChanged: () {},
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.greenButton,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                  ),
                                  child: Text(
                                    widget.transaction.status == 'PENDING'
                                        ? 'Hủy'
                                        : widget.transaction.status == 'DONE'
                                            ? businessOption ==
                                                    BusinessOption.buyer
                                                ? 'Đánh giá'
                                                : 'Xem đánh giá'
                                            : widget.transaction.status ==
                                                    'CANCELLED'
                                                ? 'Mua lại'
                                                : '',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ]),
                          const SizedBox(height: 10),
                        ])),
              ],
            ),
          ),
        )));
  }
}
