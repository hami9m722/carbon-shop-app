import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildCard('Dự án năng lượng sinh khối từ rác thải nông nghiệp', 15,
              'https://via.placeholder.com/150'),
          _buildCard('Dự án năng lượng sinh khối từ rác thải nông nghiệp', 11,
              'https://via.placeholder.com/150'),
          _buildCard('Dự án năng lượng sinh khối từ rác thải nông nghiệp', 13,
              'https://via.placeholder.com/150'),
          _buildCard('Dự án năng lượng sinh khối từ rác thải nông nghiệp', 10,
              'https://via.placeholder.com/150'),
        ],
      ),
    );
  }

  Widget _buildCard(String title, int value, String imageUrl) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Chia 50% cho tiêu đề và giá
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$value USA',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Chia 50% cho hình ảnh
            Expanded(
              flex: 1,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
