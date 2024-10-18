import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:carbon_credit_trading/theme/custom_datepicker.dart';
import 'package:carbon_credit_trading/theme/custom_textformfield.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/pages/project_image_upload_page.dart';

class ProjectRegistrationPage extends StatefulWidget {
  const ProjectRegistrationPage({super.key});

  @override
  createState() => _ProjectRegistrationPageState();
}

class _ProjectRegistrationPageState extends State<ProjectRegistrationPage> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _scaleController = TextEditingController();
  final TextEditingController _scopeController = TextEditingController();
  final TextEditingController _partnersController = TextEditingController();
  final TextEditingController _certificatesController = TextEditingController();
  final TextEditingController _issuerController = TextEditingController();
  final TextEditingController _availableCreditsController =
      TextEditingController();
  final TextEditingController _certificateIdController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _selectedPaymentMethod;
  final List<String> _paymentMethods = [
    'Chuyển khoản quốc tế',
    'Thẻ tín dụng',
    'PayPal',
    'Chuyển khoản nội địa',
  ];

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        controller.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Đăng ký dự án",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomTextFormField(
                  controller: _projectNameController, labelText: 'Tên dự án'),
              const SizedBox(height: 15),
              CustomTextFormField(
                  controller: _locationController, labelText: 'Vị trí'),
              const SizedBox(height: 15),
              CustomTextFormField(
                  controller: _scaleController, labelText: 'Quy mô'),
              const SizedBox(height: 15),
              CustomDatePickerField(
                controller: _startDateController,
                labelText: 'Thời gian bắt đầu',
                onTap: (context) {
                  _selectDate(context, _startDateController);
                },
              ),
              const SizedBox(height: 15),
              CustomDatePickerField(
                controller: _startDateController,
                labelText: 'Thời gian kết thúc',
                onTap: (context) {
                  _selectDate(context, _endDateController);
                },
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                  controller: _scopeController, labelText: 'Phạm vi'),
              const SizedBox(height: 15),
              CustomTextFormField(
                  controller: _partnersController, labelText: 'Đối tác'),
              const SizedBox(height: 15),
              CustomTextFormField(
                  controller: _certificatesController,
                  labelText: 'Chứng chỉ tín chỉ carbon'),
              const SizedBox(height: 15),
              CustomTextFormField(
                  controller: _issuerController, labelText: 'Tổ chức cấp'),
              const SizedBox(height: 15),
              CustomTextFormField(
                // Sử dụng CustomDigitField cho số lượng tín chỉ
                controller: _availableCreditsController,
                labelText: 'Số lượng tín chỉ có sẵn',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _certificateIdController,
                labelText: 'Giấy chứng nhận',
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                // Sử dụng CustomDigitField cho số lượng tín chỉ
                controller: _priceController,
                labelText: 'Giá bán (USD/tín chỉ)',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              _buildPaymentMethodDropdown(),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectImageUploadPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.greenButton,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 28), // Padding chiều ngang
                ),
                child: const Text(
                  'Tiếp theo',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodDropdown() {
    return DropdownButton2(
      hint: const Text('Chọn hình thức thanh toán'),
      items: _paymentMethods.map((method) {
        return DropdownMenuItem<String>(
          value: method,
          child: Text(method),
        );
      }).toList(),
      value: _selectedPaymentMethod,
      onChanged: (value) {
        setState(() {
          _selectedPaymentMethod = value;
        });
      },
      buttonStyleData: const ButtonStyleData(
        height: 40,
        padding: EdgeInsets.only(left: 14, right: 14),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    );
  }
}
