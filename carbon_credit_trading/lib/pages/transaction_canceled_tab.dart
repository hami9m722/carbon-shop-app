import 'package:carbon_credit_trading/globals.dart';
import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';
import 'package:carbon_credit_trading/models/user.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/theme/text_styles.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionCanceledTab extends StatelessWidget {
  const TransactionCanceledTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of pending transactions
    final List<Transaction> canceledTransactions = [
      Transaction(
        transactionId: '021',
        contractNumber: 'HD098',
        contractDate: '18/08/2024',
        projectName: 'REDD+ Bảo tồn rừng ngập mặn',
        creditAmount: '10,000',
        totalAmount: '14,000,000 USD',
        seller: User(businessName: 'EcoHome Building Corporation'),
        buyer: User(businessName: 'Coastal Mangrove Restoration Initiative'),
        projectInfo: Project(
            projectName: 'Solar Power Plant Expansion',
            startDate: '2023-01-15',
            endDate: '2024-01-15',
            location: 'California, USA',
            scale: '100 MW',
            scope: 'Increase solar capacity to reduce fossil fuel dependency.',
            partners: 'SolarTech Corp, Green Energy Solutions',
            issuer: 'California State Energy Authority',
            availableCredits: '50000',
            certificates: 'ISO 14001, Green Energy Certificate',
            price: '10.5',
            projectImages: [
              'https://example.com/images/solar_plant.jpg',
              'https://example.com/images/solar_panel.jpg',
            ],
            creditImages: [
              'https://example.com/images/solar_credit.jpg',
            ],
            paymentMethods: ['Credit Card', 'Bank Transfer'],
            status: 'approved'),
        status: 'canceled',
      ),
      Transaction(
        transactionId: '022',
        contractNumber: 'HD098',
        contractDate: '20/10/2024',
        projectName: 'REDD+ Bảo tồn rừng ngập mặn',
        creditAmount: '10,000',
        totalAmount: '14,000,000 USD',
        seller: User(businessName: 'EcoHome Building Corporation'),
        buyer: User(businessName: 'Coastal Mangrove Restoration Initiative'),
        projectInfo: Project(
            projectName: 'Wind Farm Development',
            startDate: '2022-05-20',
            endDate: '2024-05-20',
            location: 'Texas, USA',
            scale: '200 MW',
            scope: 'Generate renewable energy through wind turbines.',
            partners: 'Windy Fields Inc, EcoEnergy Partners',
            issuer: 'Texas Renewable Energy Agency',
            availableCredits: '75000',
            certificates: 'Renewable Energy Certificate, ISO 14064',
            price: '15.0',
            projectImages: [
              'https://example.com/images/wind_farm.jpg',
              'https://example.com/images/wind_turbine.jpg',
            ],
            creditImages: [
              'https://example.com/images/wind_credit.jpg',
            ],
            paymentMethods: ['PayPal', 'Bank Transfer'],
            status: 'approved'),
        status: 'canceled',
      ),
    ];

    return Scaffold(
      appBar: businessOption == 'seller' ? const CustomAppBar() : null,
      body: Container(
          color: AppColors.greyBackGround,
          child: canceledTransactions.isEmpty
              ? const Center(
                  child: Text(
                  'Không có giao dịch đã hủy',
                  style: AppTextStyles.normalText,
                ))
              : Column(
                  children: [
                    if (businessOption == 'seller')
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'Các giao dịch đã hủy',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greenButton,
                          ),
                        ),
                      ),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: canceledTransactions.length,
                        itemBuilder: (context, index) {
                          final transaction = canceledTransactions[index];
                          return TransactionItem(
                              transaction: transaction
                             );
                        },
                      ),
                    ),
                  ],
                )),
    );
  }
}
