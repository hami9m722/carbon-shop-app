import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_datepicker.dart';
import 'package:carbon_credit_trading/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class AddInfoProjectPage extends StatefulWidget {
  final VoidCallback onNext;
  final void Function(Project data) onProjectDataChanged;

  const AddInfoProjectPage(
      {super.key, required this.onNext, required this.onProjectDataChanged});

  @override
  createState() => _AddInfoProjectPage();
}

class _AddInfoProjectPage extends State<AddInfoProjectPage> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _scaleController = TextEditingController();
  final TextEditingController _scopeController = TextEditingController();
  final TextEditingController _partnersController = TextEditingController();
  final TextEditingController _issuerController = TextEditingController();
  final TextEditingController _availableCreditsController =
      TextEditingController();
  final TextEditingController _certificatesController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final List<String> _paymentMethods = [
    'Chuyển khoản quốc tế',
    'PayPal',
    'Thẻ tín dụng',
    'Chuyển khoản nội địa',
  ];

  final List<String> _selectedPaymentMethodList = [];

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
      _updateProjectData();
    }
  }

  void _updateProjectData() {
    widget.onProjectDataChanged(Project(
        projectName: _projectNameController.text,
        startDate: _startDateController.text,
        endDate: _endDateController.text,
        location: _locationController.text,
        scale: _scaleController.text,
        scope: _scopeController.text,
        partners: _partnersController.text,
        issuer: _issuerController.text,
        availableCredits: _availableCreditsController.text,
        certificates: _certificatesController.text,
        price: _priceController.text,
        paymentMethods: _selectedPaymentMethodList,
        status: 'pending'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: _projectNameController,
                labelText: 'Tên dự án',
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _locationController,
                labelText: 'Vị trí',
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _scaleController,
                labelText: 'Quy mô',
                onChanged: (value) => _updateProjectData(),
              ),
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
                controller: _endDateController,
                labelText: 'Thời gian kết thúc',
                onTap: (context) {
                  _selectDate(context, _endDateController);
                },
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _scopeController,
                labelText: 'Phạm vi',
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _partnersController,
                labelText: 'Đối tác',
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _issuerController,
                labelText: 'Tổ chức cấp',
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _availableCreditsController,
                labelText: 'Số lượng tín chỉ có sẵn',
                keyboardType: TextInputType.number,
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _certificatesController,
                labelText: 'Giấy chứng nhận',
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                controller: _priceController,
                labelText: 'Giá bán (USD/tín chỉ)',
                keyboardType: TextInputType.number,
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              const Text(
                "Hình thức thanh toán: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              _buildPaymentMethodCheckboxes(),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    widget.onNext();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenButton,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 28),
                  ),
                  child: const Text(
                    'Tiếp theo',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCheckboxes() {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: _paymentMethods.map((method) {
          final isSelected = _selectedPaymentMethodList.contains(method);
          return FilterChip(
            label: Text(
              method,
              style: const TextStyle(fontSize: 16),
            ),
            selected: _selectedPaymentMethodList.contains(method),
            selectedColor: AppColors.greenButton,
            checkmarkColor: Colors.white,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
            onSelected: (isSelected) {
              setState(() {
                if (isSelected) {
                  _selectedPaymentMethodList.add(method);
                } else {
                  _selectedPaymentMethodList.remove(method);
                }
                _updateProjectData();
              });
            },
          );
        }).toList(),
      ),
    );
  }
  // Widget _buildPaymentMethodDropdown() {
  //   return DropdownButtonHideUnderline(
  //     child: InputDecorator(
  //       decoration: const InputDecoration(
  //         labelText: 'Hình thức thanh toán',
  //         border: OutlineInputBorder(),
  //         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //       ),
  //       isEmpty: _selectedPaymentMethod == null,
  //       child: DropdownButton<String>(
  //         iconSize: 30,
  //         isExpanded: true,
  //         value: _selectedPaymentMethod,
  //         onChanged: (newValue) {
  //           setState(() {
  //             _selectedPaymentMethod = newValue;
  //           });
  //         },
  //         items: _paymentMethods.map((method) {
  //           return DropdownMenuItem<String>(
  //             value: method,
  //             child: Container(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 method,
  //                 style: const TextStyle(
  //                     fontSize: 16, fontWeight: FontWeight.normal),
  //               ),
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }
}
