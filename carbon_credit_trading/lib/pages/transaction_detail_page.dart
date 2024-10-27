import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/services/format.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:carbon_credit_trading/widgets/full_screen_view.dart';
import 'package:carbon_credit_trading/widgets/image_carousel.dart';
import 'package:flutter/material.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailPage({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    String transactionStatusMessage =
        getTransactionStatusMessage(transaction.status);

    final List<String> billImages = [
      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      '/path/to/local/image2.jpg',
    ];

    final List<String> creditImages = [
      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
      '/path/to/local/image2.jpg',
    ];

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
                    'Giao dịch ${transaction.transactionId} đã tiến hành $transactionStatusMessage',
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
                          Text('Ngày tạo đơn: 11/09/2024'),
                          Text('Ngày cập nhật: 12/09/2024'),
                          Text('Ngày bán giao hàng: 13/09/2024'),
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
                          Text('Doanh nghiệp mua:'),
                          Text(
                              'Tên doanh nghiệp: Coastal Mangrove Restoration'),
                          Text('Mã số thuế: 123456789'),
                          Text('Địa chỉ: 123 Đường ABC, TP.HCM'),
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
                          Text('Doanh nghiệp bán:'),
                          Text(
                              'Tên doanh nghiệp: EcoRestore Building Corporation'),
                          Text('Mã số thuế: 987654321'),
                          Text('Địa chỉ: 456 Đường DEF, Sydney, Úc'),
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
                          Text('Thông tin dự án:'),
                          Text(
                              'Tên sản phẩm: Sản phẩm công nghệ giảm thiểu khí thải'),
                          Text('Số lượng: 1000'),
                          Text('Đơn giá: 10,000,000 VND'),
                          Text('Thành tiền: 10,000,000,000 VND'),
                          SizedBox(height: 16.0),
                          Text('Hàng được KTV kiểm tra:'),
                          SizedBox(height: 8.0),
                        ])),
                const SizedBox(height: 16.0),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          ImageCarousel(
                            imagePaths: billImages,
                            onImageTap: (context, images, index) {
                              showFullScreen(context, images, index);
                            },
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.greenButton,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    'Tải xuống',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              )),
                          ImageCarousel(
                            imagePaths: creditImages,
                            onImageTap: (context, images, index) {
                              showFullScreen(context, images, index);
                            },
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.greenButton,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text(
                                    'Tải xuống',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              )),
                        ])),
              ],
            ),
          ),
        )));
  }
}
