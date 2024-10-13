import 'package:carbon_credit_trading/pages/credit_image_upload_page.dart';
import 'package:flutter/material.dart';

class ProjectImageUploadPage extends StatelessWidget {
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
        title: Text('Đăng tải ảnh dự án'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildImageUploadSection(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreditImageUploadPage(),
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

  Widget _buildImageUploadSection() {
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text('Chọn ảnh từ máy'),
          ),
        ),
        SizedBox(height: 10),
        Text('Hoặc'),
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // Logic to open camera and take a picture
          },
          icon: Icon(Icons.camera_alt),
          label: Text('Mở máy ảnh và chụp'),
        ),
      ],
    );
  }
}
