import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';

import '../models/user.dart';

class TransactionService {

  Future<List<Transaction>> getApprovedTransactions() async {
    return [
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
        status: 'approved',
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
        status: 'approved',
      ),
    ];
  }

  Future<List<Transaction>> getCancelledTransactions() async {
    return [
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
        status: 'approved',
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
        status: 'approved',
      ),
    ];
  }

  Future<List<Transaction>> getPendingTransactions() async {
    return [
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
        status: 'approved',
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
        status: 'approved',
      ),
    ];
  }

}
