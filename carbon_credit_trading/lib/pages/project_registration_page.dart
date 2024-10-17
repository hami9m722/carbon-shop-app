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
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  String _selectedPaymentMethod = 'Chuyển khoản quốc tế';

  final List<String> _paymentMethods = [
    'Chuyển khoản quốc tế',
    'Thẻ tín dụng',
    'PayPal',
    'Chuyển khoản nội địa',
  ];

  // Hàm mở trình chọn ngày
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.year.toString(); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Đăng ký dự án'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField('Tên dự án', 'REDD+ Bảo vệ rừng Amazon tại Acre'),
              _buildTextField('Vị trí', 'Bang Acre, Brazil'),
              _buildTextField('Quy mô', '150,000 ha rừng nhiệt đới Amazon'),
              _buildDateField(
                  'Thời gian bắt đầu', 'Chọn năm', _startDateController),
              _buildDateField(
                  'Thời gian kết thúc tín chỉ', 'Chọn năm', _endDateController),
              _buildTextField('Phạm vi', 'Giảm 200,000 tấn CO2/năm'),
              _buildTextField('Đối tác', 'UNDP, Chính phủ Brazil'),
              _buildTextField('Chứng chỉ tín chỉ carbon:', ''),
              _buildTextField(
                  'Tổ chức cấp', 'REDD+ Bảo vệ rừng Amazon tại Acre'),
              _buildNumberField(
                  'Số lượng tín chỉ có sẵn', '100,000', _quantityController),
              _buildTextField('Giấy chứng nhận', 'GS-2022-AM-Acre123'),
              _buildTextField('Thông tin khác:', ''),
              _buildNumberField(
                  'Giá bán (USD/tín chỉ)', '15', _priceController),
              _buildDropdownField('Hình thức thanh toán',
                  _selectedPaymentMethod, _paymentMethods),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectImageUploadPage(),
                    ),
                  );
                },
                child: const Text('Tiếp theo'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm tạo TextField cơ bản
  Widget _buildTextField(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  // Hàm tạo trường chọn ngày (hiển thị dưới dạng TextField nhưng mở DatePicker khi nhấn)
  Widget _buildDateField(
      String label, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          border: const OutlineInputBorder(),
        ),
        readOnly: true, // Không cho phép gõ vào
        onTap: () {
          _selectDate(context, controller); // Mở DatePicker khi nhấn vào
        },
      ),
    );
  }

  // Hàm tạo TextField cho nhập số
  Widget _buildNumberField(
      String label, String placeholder, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number, // Bàn phím số
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  // Hàm tạo DropdownButton cho combobox
  Widget _buildDropdownField(
      String label, String selectedValue, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedPaymentMethod = newValue!;
          });
        },
        items: options.map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}
