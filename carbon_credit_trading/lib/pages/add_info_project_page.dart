import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_datepicker.dart';
import 'package:flutter/material.dart';

class AddInfoProjectPage extends StatefulWidget {
  final VoidCallback onNext;
  final void Function(Project data) onProjectDataChanged;
  final Project? initialProject; // Use a Project object to hold initial data

  const AddInfoProjectPage({
    super.key,
    required this.onNext,
    required this.onProjectDataChanged,
    this.initialProject,
  });

  @override
  createState() => _AddInfoProjectPage();
}

class _AddInfoProjectPage extends State<AddInfoProjectPage> {
  late TextEditingController _projectNameController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _locationController;
  late TextEditingController _scaleController;
  late TextEditingController _scopeController;
  late TextEditingController _partnersController;
  late TextEditingController _issuerController;
  late TextEditingController _availableCreditsController;
  late TextEditingController _certificatesController;
  late TextEditingController _priceController;
  final List<String> _paymentMethods = [
    'Chuyển khoản quốc tế',
    'PayPal',
    'Thẻ tín dụng',
    'Chuyển khoản nội địa',
  ];

  final List<String> _selectedPaymentMethodList = [];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initial project data if provided
    _projectNameController =
        TextEditingController(text: widget.initialProject?.projectName);
    _startDateController =
        TextEditingController(text: widget.initialProject?.startDate);
    _endDateController =
        TextEditingController(text: widget.initialProject?.endDate);
    _locationController =
        TextEditingController(text: widget.initialProject?.location);
    _scaleController =
        TextEditingController(text: widget.initialProject?.scale);
    _scopeController =
        TextEditingController(text: widget.initialProject?.scope);
    _partnersController =
        TextEditingController(text: widget.initialProject?.partners);
    _issuerController =
        TextEditingController(text: widget.initialProject?.issuer);
    _availableCreditsController =
        TextEditingController(text: widget.initialProject?.availableCredits);
    _certificatesController =
        TextEditingController(text: widget.initialProject?.certificates);
    _priceController =
        TextEditingController(text: widget.initialProject?.price);
    _selectedPaymentMethodList
        .addAll(widget.initialProject?.paymentMethods ?? []);
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
      status: 'pending',
    ));
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
              TextFormField(
                controller: _projectNameController,
                decoration: const InputDecoration(
                  labelText: 'Tên dự án',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequiredField('Tên dự án', value!),
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Vị trí',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequiredField('Vị trí', value!),
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _scaleController,
                decoration: const InputDecoration(
                  labelText: 'Quy mô',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequiredField('Quy mô', value!),
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
              TextFormField(
                controller: _scopeController,
                decoration: const InputDecoration(
                  labelText: 'Phạm vi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequiredField('Phạm vi', value!),
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _partnersController,
                decoration: const InputDecoration(
                  labelText: 'Đối tác',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequiredField('Đối tác', value!),
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _issuerController,
                decoration: const InputDecoration(
                  labelText: 'Tổ chức cấp',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequiredField('Tổ chức cấp', value!),
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _availableCreditsController,
                decoration: const InputDecoration(
                  labelText: 'Số lượng tín chỉ có sẵn',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => Validators.validateRequiredField(
                    'Số lượng tín chỉ có sẵn', value!),
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _certificatesController,
                decoration: const InputDecoration(
                  labelText: 'Giấy chứng nhận',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    Validators.validateRequiredField('Giấy chứng nhận', value!),
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Giá bán (USD/tín chỉ)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => Validators.validateRequiredField(
                    'Giá bán (USD/tín chỉ)', value!),
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
            selected: isSelected,
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
}
