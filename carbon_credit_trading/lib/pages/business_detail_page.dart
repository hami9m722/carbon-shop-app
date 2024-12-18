import 'package:carbon_credit_trading/models/comment.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/custom_menu_widget.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:carbon_credit_trading/widgets/feedback_item.dart';
import 'package:carbon_credit_trading/widgets/project_item.dart';
import 'package:flutter/material.dart';

/*Description
  show company info (image, name, email, taxCode, address, industry), user(name, phone)
  list company projects (name, price, project image[0])
  list company reviews (userImage, companyName, rating, date, currentAcc dislike or likelike)

*/

class BusinessDetailPage extends StatelessWidget {
  const BusinessDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey userInfoKey = GlobalKey();
    final List<Comment> feedbackList = [
      Comment(
        userName: 'Renewable Biomass Energy Ventures',
        date: '13/06/2019',
        review:
            'Dự án này không chỉ giúp giảm phát thải khí nhà kính mà còn đóng góp tích cực cho việc phát triển bền vững vùng ven biển.',
        images: ['img1.jpg', 'img2.jpg', 'img3.jpg'],
        rating: 3,
        likes: ['You', 'user1'],
        dislikes: ['user2'],
        userImage: 'assets/user1.png',
      ),
      Comment(
        userName: 'Coastal Mangrove Restoration Initiative',
        date: '14/08/2019',
        review:
            'Chúng tôi cảm thấy dự án này góp phần tái sinh rừng nguyên sinh và giúp cải thiện đời sống của người dân địa phương.',
        images: ['img4.jpg', 'img5.jpg', 'img6.jpg'],
        rating: 4,
        likes: ['user3'],
        dislikes: ['You'],
        userImage: 'assets/user2.png',
      ),
    ];

    final List<Project> projects = [
      Project(
          projectName: 'Dự án năng lượng sinh khối từ rác thải nông nghiệp',
          startDate: '01/01/2023',
          endDate: '01/01/2025',
          location: 'Việt Nam',
          scale: 'Lớn',
          scope: 'Toàn quốc',
          partners: 'Công ty ABC',
          issuer: 'Chính phủ',
          availableCredits: '1000',
          certificates: 'ISO 9001',
          price: '1000 VND',
          projectImages: [
            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'
          ],
          creditImages: [],
          paymentMethods: ['Chuyển khoản', 'Tiền mặt'],
          status: 'approved'),
      Project(
          projectName: 'Dự án năng lượng mặt trời',
          startDate: '01/06/2023',
          endDate: '01/06/2024',
          location: 'Việt Nam',
          scale: 'Trung bình',
          scope: 'Khu vực miền Trung',
          partners: 'Công ty XYZ',
          issuer: 'Công ty TNHH',
          availableCredits: '500',
          certificates: 'ISO 14001',
          price: '800 VND',
          projectImages: ['https://via.placeholder.com/150'],
          creditImages: [],
          paymentMethods: ['Thẻ tín dụng', 'Tiền mặt'],
          status: 'approved'),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Trang cá nhân",
        color: AppColors.greyBackGround,
      ),
      body: Container(
        color: AppColors.greyBackGround,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70), // Move it down
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            customRichText(
                              title: 'Tên doanh nghiệp:',
                              value: 'Renewable Biomass Energy Ventures',
                            ),
                            const SizedBox(height: 20),
                            customRichText(
                              title: 'Mã số thuế:',
                              value: '1029384756',
                            ),
                            const SizedBox(height: 20),
                            customRichText(
                              title: 'Địa chỉ:',
                              value: 'Jakarta, Indonesia',
                            ),
                            const SizedBox(height: 20),
                            customRichText(
                              title: 'Ngành nghề kinh doanh:',
                              value: 'Năng lượng sinh khối và tái tạo',
                            ),
                            const SizedBox(height: 20),
                            customRichText(
                              title: 'Email:',
                              value: 'andi@renewablebiomass.id',
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Thông tin người đại diện:',
                              style: TextStyle(
                                  fontSize: 17, fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(height: 10),
                            customRichText(
                              title: 'Họ và tên:',
                              value: 'Andi Pratama',
                            ),
                            const SizedBox(height: 10),
                            customRichText(
                              title: 'Số điện thoại:',
                              value: '+62 21 987 6543',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 20,
                      child: GestureDetector(
                        key: userInfoKey,
                        onTap: () {
                          RenderBox renderBox = userInfoKey.currentContext!
                              .findRenderObject() as RenderBox;
                          Offset offset = renderBox.localToGlobal(Offset.zero);

                          double top = offset.dy + renderBox.size.height;

                          CustomMenuWidget.showCustomMenu(context,
                              left: 0,
                              top: top + 10,
                              isBusinessDetailPage: true);
                        },
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Color.fromARGB(255, 200, 200, 200),
                          child: Icon(Icons.person, size: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Danh sách dự án đăng bán",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return ProjectItem(
                    project: project,
                  );
                },
              )),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Đánh giá doanh nghiệp",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: feedbackList.length,
                  itemBuilder: (context, index) {
                    final feedback = feedbackList[index];

                    return FeedbackItem(feedback: feedback);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
