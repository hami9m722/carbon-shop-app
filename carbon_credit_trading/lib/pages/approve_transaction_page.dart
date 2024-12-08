import 'dart:io';

import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/services/format.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_datepicker.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:carbon_credit_trading/widgets/custom_textformfield.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:carbon_credit_trading/widgets/image_upload_section.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class ApproveTransactionPage extends StatefulWidget {
  final Transaction transaction;
  const ApproveTransactionPage({super.key, required this.transaction});

  @override
  createState() => _ApproveTransactionPageState();
}

class _ApproveTransactionPageState extends State<ApproveTransactionPage> {
  String? fileName;
  String? filePath;
  List<File> billImages = [];
  List<File> creditImages = [];
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

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

    void addCreditImage(File newImage) {
      setState(() {
        creditImages.add(newImage);
      });
    }

    void removeCreditImage(File image) {
      setState(() {
        creditImages.remove(image);
      });
    }

    void addBillImage(File newImage) {
      setState(() {
        billImages.add(newImage);
      });
    }

    void removeBillImage(File image) {
      setState(() {
        billImages.remove(image);
      });
    }

    Future<void> _selectDate(
        BuildContext context, TextEditingController controller) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        setState(() {
          controller.text =
              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
        });
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(title: "Duyệt hợp đồng"),
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
                    'Giao dịch ${widget.transaction.transactionId} đã tiến hành $transactionStatusMessage',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Colors.white,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ngày tạo đơn: 11/09/2024',
                          style: AppTextStyles.normalText),
                      Text('Ngày ký hợp đồng: 12/09/2024',
                          style: AppTextStyles.normalText),
                      Text('Ngày thanh toán: 13/09/2024',
                          style: AppTextStyles.normalText),
                      Text('Ngày bàn giao tín chỉ:',
                          style: AppTextStyles.normalText),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Colors.white,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Doanh nghiệp mua',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text('Tên doanh nghiệp: Coastal Mangrove Restoration',
                          style: AppTextStyles.normalText),
                      Text('Mã số thuế: 123456789',
                          style: AppTextStyles.normalText),
                      Text('Địa chỉ: 123 Đường ABC, TP.HCM',
                          style: AppTextStyles.normalText),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Colors.white,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Doanh nghiệp bán',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text('Tên doanh nghiệp: EcoRestore Building Corporation',
                          style: AppTextStyles.normalText),
                      Text('Mã số thuế: 987654321',
                          style: AppTextStyles.normalText),
                      Text('Địa chỉ: 456 Đường DEF, Sydney, Úc',
                          style: AppTextStyles.normalText),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  color: Colors.white,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thông tin dự án',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      Text('Tên dự án: REDD+ Bảo tồn rừng ngập mặn Thái Lan',
                          style: AppTextStyles.normalText),
                      Text('Vị trí: Vịnh Thái Lan',
                          style: AppTextStyles.normalText),
                      Text('Quy mô: 20,000 ha',
                          style: AppTextStyles.normalText),
                      Text('Thời gian: 2021 - 2041',
                          style: AppTextStyles.normalText),
                      Text(
                          'Phạm vi: Giảm 60,000 tấn CO2/năm, bảo vệ hệ sinh thái ven biển',
                          style: AppTextStyles.normalText),
                      Text('Số lượng cần bán: 100,000',
                          style: AppTextStyles.normalText),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              horizontal: 10.0,
                              vertical: 15), // Adjust padding here
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
                                    child:
                                        Text(fileName ?? 'Chọn tệp hợp đồng'),
                                  ),
                                ),
                                if (fileName !=
                                    null) // Show the X button only if a file is selected
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.cancel,
                                        color: Colors.red),
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
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5.0),
                      Container(
                        constraints: const BoxConstraints(minHeight: 130),
                        child: ImageUploadSection(
                          imageFiles: billImages,
                          onRemoveImage: removeBillImage,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ImagePickerButton(
                        onImageSelected: addBillImage,
                        imageFiles: billImages,
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
                      const Text('Hình ảnh tín chỉ',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
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
                        onImageSelected: addCreditImage,
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
                      CustomTextFormField(
                        controller: _priceController,
                        labelText: 'Giá bán (USD/tín chỉ)',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      CustomDatePickerField(
                        controller: _startDateController,
                        labelText: 'Ngày ký thanh toán',
                        onTap: (context) {
                          _selectDate(context, _startDateController);
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomDatePickerField(
                        controller: _endDateController,
                        labelText: 'Ngày ký bàn giao tín chỉ',
                        onTap: (context) {
                          _selectDate(context, _endDateController);
                        },
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () {},
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
          ),
        ),
      ),
    );
  }
}
