import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_year_picker.dart';
import 'package:flutter/material.dart';

/*Description
  input for project(
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

class AddInfoProjectPage extends StatefulWidget {
  final VoidCallback onNext;
  final void Function(Project data) onProjectDataChanged;
  final Project? initialProject;

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

  String? _validateStartEndDate() {
    final startYear = int.tryParse(_startDateController.text);
    final endYear = int.tryParse(_endDateController.text);

    if (startYear != null && endYear != null) {
      if (startYear > endYear) {
        return 'Thời gian bắt đầu phải nhỏ hơn hoặc bằng thời gian kết thúc';
      }
    }

    return null;
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
              CustomYearPicker(
                controller: _startDateController,
                labelText: 'Thời gian bắt đầu',
                startYear: DateTime.now().year,
                endYear: DateTime.now().year + 100,
                onChanged: (value) => _updateProjectData(),
              ),
              const SizedBox(height: 15),
              CustomYearPicker(
                controller: _endDateController,
                labelText: 'Thời gian kết thúc',
                startYear: DateTime.now().year,
                endYear: DateTime.now().year + 100,
                onChanged: (value) => _updateProjectData(),
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
                keyboardType: TextInputType.number,
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
                    String? error = _validateStartEndDate();
                    if (error != null) {
                      // Hiển thị lỗi nếu có
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(error)));
                    } else {
                      widget.onNext();
                    }
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
