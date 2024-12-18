import 'dart:io';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/add_file_widget.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/star_rating.dart';
import 'package:flutter/material.dart';

/*Description
  input for seller company comment 
  show seller company info (name, address, taxCode)
  input for project comment
  show project info (name, address, size, timeStart, timeEnd, produceCarbonRate)
  rating

*/

class AddFeedbackPage extends StatefulWidget {
  const AddFeedbackPage({super.key});

  @override
  createState() => _AddFeedbackPageState();
}

class _AddFeedbackPageState extends State<AddFeedbackPage> {
  List<File> imageList = [];
  File? video;
  double rating = 0.0;

  void _handleImageListChanged(List<File> newList) {
    setState(() {
      imageList = newList;
    });
  }

  void _handleVideoChanged(File? newVideo) {
    setState(() {
      video = newVideo;
    });
  }

  void _handleRatingChanged(double newRating) {
    setState(() {
      rating = newRating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Đánh Giá Doanh Nghiệp',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Text(
                'Đánh giá doanh nghiệp bán',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Doanh nghiệp bán:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tên doanh nghiệp: Coastal Mangrove Restoration Initiative',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Mã số thuế: 1122334455',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Địa chỉ: Bangkok, Thái Lan',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Đánh giá của bạn',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Text(
                'Đánh giá dự án',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.white,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin dự án:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tên dự án: REDD+ Bảo tồn rừng ngập mặn Thái Lan',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Vị trí: Ven biển Thái Lan',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Quy mô: 20000 ha',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Thời gian: 2021-2041',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Phạm vi: Giảm 60000 tấn CO2/năm, bảo vệ hệ sinh thái ven biển',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: [
                  const Text(
                    'Thang điểm:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  StarRating(
                    rating: rating,
                    onRatingChanged: _handleRatingChanged,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Đánh giá của bạn',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              child: AddFileWidget(
                imageList: imageList,
                video: video,
                onImageListChanged: _handleImageListChanged,
                onVideoChanged: _handleVideoChanged,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    //handle when click submit button
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenButton,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Gửi',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
