import 'dart:io';

import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/extensions/datetime.dart';
import 'package:carbon_credit_trading/extensions/file_id.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/services/utils.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_date_picker.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:carbon_credit_trading/widgets/image_upload_section.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

/*Description
  field to show: date create order, date approve transaction, date pay transaction, date deliver credits
                  seller company (name, address, taxCode)
                   buyer company (name, address, taxCode)
                  project info (name, address, size, timeStart, timeEnd, produceCarbonRate)
 upload contract file
  upload bill images,
  upload credit images,

  approve order

*/

class ApproveTransactionPage extends StatefulWidget {
  final Transaction transaction;

  const ApproveTransactionPage({super.key, required this.transaction});

  @override
  createState() => _ApproveTransactionPageState();
}

class _ApproveTransactionPageState extends State<ApproveTransactionPage> {
  String? fileName;
  String? filePath;
  File? billImage;
  List<File> creditImages = [];
  final TextEditingController _contractSignDateController =
      TextEditingController();
  final TextEditingController _payDateController = TextEditingController();
  final TextEditingController _deliveryDateController = TextEditingController();

  Future<void>? processing;

  Future<void> pickBillImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        billImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String transactionStatusMessage =
        getTransactionStatusMessage(widget.transaction.status);

    void uploadFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          filePath = result.files.single.path;
          fileName = result.files.single.name;
        });
      } else {
        // User canceled the picker
      }
    }

    void deleteFile() {
      setState(() {
        fileName = null;
        filePath = null;
      });
    }

    void openFile() async {
      if (filePath != null) {
        await OpenFile.open(filePath);
      }
    }

    void addCreditImage(List<File> newImages) {
      setState(() {
        creditImages.addAll(newImages);
      });
    }

    void removeCreditImage(dynamic image) {
      setState(() {
        creditImages.remove(image);
      });
    }

    Future<void> approveOrder() async {
      var contractFile = filePath != null
          ? await fileControllerApi.upload(
              uploadRequest: UploadRequest(
                  file: await MultipartFile.fromPath('file', filePath!,
                      filename: fileName)))
          : null;
      var certImages =
          await Future.wait(creditImages.map((e) => e.upload()).toList());
      var paymentBillFile = await billImage?.upload();
      await mediatorAuditControllerApi.doneProcessOrder(
          widget.transaction.transactionId,
          MediatorDoneOrderDTO(
            contractFile: contractFile,
            certImages: certImages,
            paymentBillFile: paymentBillFile,
            contractSignDate: _contractSignDateController.text.toDateTime(),
            payDate: _payDateController.text.toDateTime(),
            deliveryDate: _deliveryDateController.text.toDateTime(),
            message: "Transaction approved",
          ));

      setState(() {});
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Duyệt hợp đồng"),
      body: SafeArea(
        child: Container(
          color: AppColors.greyBackGround,
          child: processing == null
              ? buildDetails(
                  transactionStatusMessage,
                  openFile,
                  deleteFile,
                  uploadFile,
                  removeCreditImage,
                  addCreditImage,
                  context,
                  approveOrder)
              : FutureBuilder(
                  future: processing,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text('Có lỗi xảy ra khi xử lý giao dịch'));
                    } else {
                      Navigator.pop(context);
                      return const Center(
                          child: Text('Giao dịch đã được xử lý thành công'));
                    }
                  }),
        ),
      ),
    );
  }

  SingleChildScrollView buildDetails(
      String transactionStatusMessage,
      void openFile(),
      void deleteFile(),
      void uploadFile(),
      void removeCreditImage(dynamic image),
      void addCreditImage(List<File> newImages),
      BuildContext context,
      Future<void> approveOrder()) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.green,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Giao dịch ${widget.transaction.transactionId} đã tiến hành $transactionStatusMessage',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Doanh nghiệp mua',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text(
                    'Tên doanh nghiệp: ${widget.transaction.buyerCompany?.name}',
                    style: AppTextStyles.normalText),
                Text('Mã số thuế: ${widget.transaction.buyerCompany?.taxCode}',
                    style: AppTextStyles.normalText),
                Text('Địa chỉ: ${widget.transaction.buyerCompany?.address}',
                    style: AppTextStyles.normalText),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Doanh nghiệp bán',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text(
                    'Tên doanh nghiệp: ${widget.transaction.projectInfo.company?.name})',
                    style: AppTextStyles.normalText),
                Text(
                    'Mã số thuế:  ${widget.transaction.projectInfo.company?.taxCode}',
                    style: AppTextStyles.normalText),
                Text(
                    'Địa chỉ:  ${widget.transaction.projectInfo.company?.address}',
                    style: AppTextStyles.normalText),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: Colors.white,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Tên dự án: ${widget.transaction.projectInfo.company?.name}',
                    style: AppTextStyles.normalText),
                Text('Vị trí: ${widget.transaction.projectInfo.location}',
                    style: AppTextStyles.normalText),
                Text('Quy mô: ${widget.transaction.projectInfo.scale}',
                    style: AppTextStyles.normalText),
                Text(
                    'Thời gian: ${widget.transaction.projectInfo.startDate} - ${widget.transaction.projectInfo.endDate}',
                    style: AppTextStyles.normalText),
                Text('Phạm vi: ${widget.transaction.projectInfo.scope}',
                    style: AppTextStyles.normalText),
                Text(
                    'Số lượng cần bán: ${widget.transaction.projectInfo.availableCredits}',
                    style: AppTextStyles.normalText),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                customRichText(
                  title: "Hợp đồng",
                  value: "Đã ký",
                  valueColor: Colors.red,
                  valueWeight: FontWeight.bold,
                ),
                if (fileName != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15), // Adjust padding here
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: openFile,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greenButton,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Text(fileName ?? 'Chọn tệp hợp đồng'),
                            ),
                          ),
                          if (fileName !=
                              null) // Show the X button only if a file is selected
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.cancel, color: Colors.red),
                              onPressed: () {
                                // Implement the remove file logic here
                                deleteFile();
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
                if (fileName == null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: uploadFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenButton,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Đăng tải',
                          style: AppTextStyles.normalText),
                    ),
                  ),
                const Text('Hóa đơn thanh toán',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5.0),
                Container(
                  constraints: const BoxConstraints(minHeight: 130),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greenPopUpText),
                    borderRadius: BorderRadius.circular(10),
                    image: billImage != null
                        ? DecorationImage(
                            image: FileImage(billImage!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: pickBillImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greenButton,
                      foregroundColor: Colors.white,
                    ),
                    child:
                        const Text('Đăng tải', style: AppTextStyles.normalText),
                  ),
                ),
                const Text('Hình ảnh tín chỉ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5.0),
                Container(
                  constraints: const BoxConstraints(
                      minHeight: 130), // Set your min height
                  child: ImageUploadSection(
                    imageFiles: creditImages,
                    onRemoveImage: removeCreditImage,
                  ),
                ),
                const SizedBox(height: 15),
                ImagePickerButton(
                  onImagesSelected: addCreditImage,
                  imageFiles: creditImages,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 20),
                      decoration: BoxDecoration(
                        color: AppColors.greenButton,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Đăng tải',
                        style: AppTextStyles.normalText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CustomDatePicker(
                  controller: _contractSignDateController,
                  //TODO: add contractSignDate, transferDate, payDate field for order
                  labelText: 'Ngày ký hợp đồng',
                ),
                const SizedBox(height: 15),
                CustomDatePicker(
                  controller: _payDateController,
                  labelText: 'Ngày ký thanh toán',
                ),
                const SizedBox(height: 15),
                CustomDatePicker(
                  controller: _deliveryDateController,
                  labelText: 'Ngày ký bàn giao tín chỉ',
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      processing = approveOrder();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.greenButton,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Xác nhận giao dịch đã thành công',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
