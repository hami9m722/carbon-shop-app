import 'package:carbon_credit_trading/pages/project_image_upload_page.dart';
import 'package:flutter/material.dart';

class ProjectRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Đăng ký dự án'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField('Tên dự án', 'REDD+ Bảo vệ rừng Amazon tại Acre'),
            _buildTextField('Vị trí', 'Bang Acre, Brazil'),
            _buildTextField('Quy mô', '150,000 ha rừng nhiệt đới Amazon'),
            _buildTextField('Thời gian bắt đầu', '2019'),
            _buildTextField('Thời gian kết thúc tín chỉ', ''),
            _buildTextField('Phạm vi', 'Giảm 200,000 tấn CO2/năm'),
            _buildTextField('Đối tác', 'UNDP, Chính phủ Brazil'),
            _buildTextField('Chứng chỉ tín chỉ carbon:', ''),
            _buildTextField('Tổ chức cấp', 'REDD+ Bảo vệ rừng Amazon tại Acre'),
            _buildTextField('Số lượng tín chỉ có sẵn', '100,000'),
            _buildTextField('Giấy chứng nhận', 'GS-2022-AM-Acre123'),
            _buildTextField('Thời gian bắt đầu dự án', '2019'),
            _buildTextField('Thông tin khác:', ''),
            _buildTextField('Giá bán (USD/tín chỉ)', '15'),
            _buildTextField('Hình thức thanh toán', 'Chuyển khoản quốc tế'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectImageUploadPage(),
                  ),
                );
              },
              child: Text('Tiếp theo'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: placeholder,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
