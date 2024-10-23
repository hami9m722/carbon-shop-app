import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết dự án'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hình ảnh dự án
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/project_image.jpg'), // Thay đổi đường dẫn hình ảnh
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Thông tin dự án
              Text(
                'Thông tin dự án:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Tên dự án: REDD+: Bảo tồn rừng ngập mặn Thái Lan'),
              Text('Vị trí: Vịnh Thái Lan'),
              Text('Quy mô: 20,000 ha'),
              Text('Thời gian: 2021 - 2041'),
              Text(
                  'Phạm vi: Giảm 60,000 tấn CO2/năm, bảo vệ hệ sinh thái ven biển'),
              Text('Số lượng cần bán: 100,000'),
              SizedBox(height: 16),
              // Chứng chỉ carbon
              Text(
                'Chứng chỉ tín chỉ carbon:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Tiêu chuẩn tín chỉ: VCS (Verified Carbon Standard)'),
              Text('Mã tín chỉ: VCS-AB123456'),
              Text('Ngày phát hành: 10/09/2024'),
              Text('Thời gian hiệu lực: Vĩnh viễn (sau khi đã giao dịch)'),
              Text('Người nắm giữ tín chỉ: Green Earth Ventures'),
              Text('Chứng nhận bởi: TƯV SÜD (Tổ chức giám sát độc lập)'),
              SizedBox(height: 16),
              // Thông tin chi tiết
              Text(
                'Thông tin chi tiết:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '• Tổ chức chuẩn bị: TƯV SÜD đã xác minh dự án đáp ứng các tiêu chí của VCS và cấp tín chỉ carbon cho dự án này.',
              ),
              Text(
                '• Công nghệ hiện tại: Sử dụng công nghệ vệ tinh để theo dõi diện tích rừng và đảm bảo rừng không bị khai thác.',
              ),
              SizedBox(height: 16),
              // Doanh nghiệp
              Text(
                'Doanh nghiệp bảo trợ:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Renewable Biomass Energy Ventures'),
              SizedBox(height: 16),
              // Nút lưu và mua
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Thêm chức năng lưu ở đây
                    },
                    child: Text('Lưu'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Thêm chức năng mua ở đây
                    },
                    child: Text('Mua'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Nút xem đánh giá
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Thêm chức năng xem đánh giá ở đây
                  },
                  child: Text('Xem đánh giá'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
