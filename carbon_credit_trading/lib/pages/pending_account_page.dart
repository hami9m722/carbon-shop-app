import 'package:carbon_credit_trading/pages/check_account_page.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

//show company info (image, name, email, taxCode, address, industry), user(name, phone)

class PendingAccountPage extends StatefulWidget {
  final String? searchQuery;

  const PendingAccountPage({super.key, this.searchQuery});

  @override
  createState() => _PendingAccountPageState();
}

class _PendingAccountPageState extends State<PendingAccountPage> {
  Future<List<Map<String, dynamic>>> getPendingAccount() async {
    try {
      final pendingUsers = await mediatorAuditControllerApi.viewAllUser();

      if (pendingUsers != null) {
        List<Map<String, dynamic>> userList = await Future.wait(
          pendingUsers.content.map((user) async {
            final company =
                await sellerControllerApi.viewCompany(user.company ?? 00);

            return {
              'id': user.userId,
              'name': user.name,
              'phone': user.phone,
              'company': company,
            };
          }).toList(),
        );

        return userList;
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching pending accounts: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Tài khoản đang chờ duyệt",
      ),
      body: FutureBuilder(
        future: getPendingAccount(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Có lỗi xảy ra khi tải'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Không có tài khoản nào cần duyệt',
                textAlign: TextAlign.center,
                softWrap: true,
                style: AppTextStyles.normalText,
              ),
            );
          } else {
            final pendingAccounts = snapshot.data!;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: pendingAccounts.length,
              itemBuilder: (context, index) {
                final account = pendingAccounts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckAccountPage(
                          accountDetails: account,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  account['userId'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                account['company'].taxCode ?? "N/A",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
