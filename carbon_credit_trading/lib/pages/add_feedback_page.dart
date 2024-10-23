import 'package:flutter/material.dart';

class AddFeedbackPage extends StatelessWidget {
  const AddFeedbackPage({super.key});
  // Đổi tên tại đây
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đánh Giá Doanh Nghiệp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Đánh giá doanh nghiệp bán:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Tên doanh nghiệp: Coastal Mangrove Restoration Initiative'),
            Text('Mã số thuế: 1122334455'),
            Text('Địa chỉ: Bangkok, Thái Lan'),
            SizedBox(height: 16),
            Text(
              'Đánh giá của bạn:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập đánh giá của bạn...',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Thông tin dự án:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tên dự án: REDD+: Bảo tồn rừng ngập mặn Thái Lan'),
                  Text('Vị trí: Vịnh Thái Lan'),
                  Text('Quy mô: 20,000 ha'),
                  Text('Thời gian: 2021 - 2041'),
                  Text(
                      'Phạm vi: Giảm 60,000 tấn CO2/năm, bảo vệ hệ sinh thái ven biển'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Thêm chức năng thêm hình ảnh ở đây
                  },
                  child: Text('Thêm hình ảnh'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Thêm chức năng gửi đánh giá ở đây
                  },
                  child: Text('Gửi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
