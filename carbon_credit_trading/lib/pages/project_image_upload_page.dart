import 'package:carbon_credit_trading/pages/credit_image_upload_page.dart';
import 'package:flutter/material.dart';

class ProjectImageUploadPage extends StatelessWidget {
  const ProjectImageUploadPage({super.key});

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
        title: const Text('Đăng tải ảnh dự án'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildImageUploadSection(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreditImageUploadPage(),
                  ),
                );
              },
              child: const Text('Tiếp theo'),
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
          child: const Center(
            child: Text('Chọn ảnh từ máy'),
          ),
        ),
        const SizedBox(height: 10),
        const Text('Hoặc'),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // Logic to open camera and take a picture
          },
          icon: const Icon(Icons.camera_alt),
          label: const Text('Mở máy ảnh và chụp'),
        ),
      ],
    );
  }
}
