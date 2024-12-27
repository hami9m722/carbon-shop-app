import 'dart:io';
import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/extensions/file_id.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/services/service.dart';
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
  final Transaction transaction;

  const AddFeedbackPage({super.key, required this.transaction});

  @override
  createState() => _AddFeedbackPageState();
}

class _AddFeedbackPageState extends State<AddFeedbackPage> {
  List<File> imageList = [];
  File? video;
  double rating = 0.0;
  final TextEditingController _controller = TextEditingController();

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

  Future<void> addFeedback() async {
    var images = await Future.wait(imageList
        .map((image) async => await fileControllerApi.uploadFile(image)));
    await buyerControllerApi.reviewProject(
      widget.transaction.projectInfo.projectId!,
      BuyerReviewProjectDTO(
          images: images,
          rate: rating.ceil(),
          message: _controller.text.trim()),
    );
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
                'Đánh giá doanh nghiệp bán và dự án',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Doanh nghiệp bán:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tên doanh nghiệp: ${widget.transaction.projectInfo.company?.name}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Mã số thuế: ${widget.transaction.projectInfo.company?.taxCode}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Địa chỉ: ${widget.transaction.projectInfo.company?.address}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thông tin dự án:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tên dự án: ${widget.transaction.projectName}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Vị trí: ${widget.transaction.projectInfo.location}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Quy mô:  ${widget.transaction.projectInfo.scale}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Thời gian:  ${widget.transaction.projectInfo.startDate} -  ${widget.transaction.projectInfo.endDate}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Phạm vi:  ${widget.transaction.projectInfo.scope}',
                    style: const TextStyle(fontSize: 16),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: TextField(
                controller: _controller,
                maxLines: 5,
                decoration: const InputDecoration(
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
                    addFeedback();
                    Navigator.pop(context);
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
