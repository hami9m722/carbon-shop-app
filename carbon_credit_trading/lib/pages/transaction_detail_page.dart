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

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    String transactionStatusMessage =
        getTransactionStatusMessage(transaction.status);

    String billImage = transaction.rootDto.paymentBillFile?.toFilePath() ?? '';

    final List<String> creditImages = transaction.rootDto.certImages.map((e) => e.toFilePath()).toList();

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
                    'Giao dịch ${transaction.transactionId} $transactionStatusMessage',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ngày tạo đơn: 11/09/2024',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Ngày ký hợp đồng: 12/09/2024',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Ngày thanh toán: 13/09/2024',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Ngày bàn giao tín chỉ:',
                            style: AppTextStyles.normalText,
                          ),
                        ])),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doanh nghiệp mua',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tên doanh nghiệp: Coastal Mangrove Restoration',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Mã số thuế: 123456789',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Địa chỉ: 123 Đường ABC, TP.HCM',
                            style: AppTextStyles.normalText,
                          ),
                        ])),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Doanh nghiệp bán',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tên doanh nghiệp: EcoRestore Building Corporation',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Mã số thuế: 987654321',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Địa chỉ: 456 Đường DEF, Sydney, Úc',
                            style: AppTextStyles.normalText,
                          ),
                        ])),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông tin dự án',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tên dự án: REDD+ Bảo tồn rừng ngập mặn Thái Lan',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Vị trí: Vịnh Thái Lan',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Quy mô: 20,000 ha',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Thời gian: 2021 - 2041',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Phạm vi: Giảm 60,000 tấn CO2/năm, bảo vệ hệ sinh thái ven biển',
                            style: AppTextStyles.normalText,
                          ),
                          Text(
                            'Số lượng cần bán: 100,000',
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
                              child: const Text('hopdong234.docs'),
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
                          if (!(businessOption == 'seller' &&
                              transaction.status == 'canceled'))
                            Column(children: [
                              const SizedBox(height: 20),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TextButton(
                                  onPressed: () {
                                    if (transaction.status == 'pending') {
                                    } else if (transaction.status ==
                                        'approved') {
                                      if (businessOption == 'buyer') {
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
                                    } else if (transaction.status ==
                                        'canceled') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProjectDetailPage(
                                                  project:
                                                      transaction.projectInfo),
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
                                    transaction.status == 'pending'
                                        ? 'Hủy'
                                        : transaction.status == 'approved'
                                            ? businessOption ==
                                                    'buyer' // or check userID = buyer userID
                                                ? 'Đánh giá'
                                                : 'Xem đánh giá'
                                            : transaction.status == 'canceled'
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
