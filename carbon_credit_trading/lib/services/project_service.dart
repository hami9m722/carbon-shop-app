import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/models/transaction.dart';

import '../models/user.dart';

class ProjectService {

  Future<List<Project>> getApprovedProjects() async {
    return [
      Project(
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
        status: 'approved',
      ),
      Project(
        projectName: 'Wind Farm Development',
        startDate: '2022-05-20',
        endDate: '2024-05-20',
        location: 'Texas, USA',
        scale: '200 MW',
        scope: 'Generate renewable energy through wind turbines.',
        partners: 'Windy Fields Inc, EcoEnergy Partners',
        issuer: 'Texas Renewable Energy Agency',
        availableCredits: '75000',
        certificates: 'ISO 14001, Green Energy Certificate',
        price: '12.5',
        projectImages: [
          'https://example.com/images/wind_farm.jpg',
          'https://example.com/images/wind_turbine.jpg',
        ],
        creditImages: [
          'https://example.com/images/wind_credit.jpg',
        ],
        paymentMethods: ['Credit Card', 'Bank Transfer'],
        status: 'approved',
      ),
    ];
  }

  Future<List<Project>> getCanceledProjects() async {
    return [
      Project(
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
        status: 'canceled',
      ),
      Project(
        projectName: 'Wind Farm Development',
        startDate: '2022-05-20',
        endDate: '2024-05-20',
        location: 'Texas, USA',
        scale: '200 MW',
        scope: 'Generate renewable energy through wind turbines.',
        partners: 'Windy Fields Inc, EcoEnergy Partners',
        issuer: 'Texas Renewable Energy Agency',
        availableCredits: '75000',
        certificates: 'ISO 14001, Green Energy Certificate',
        price: '12.5',
        projectImages: [
          'https://example.com/images/wind_farm.jpg',
          'https://example.com/images/wind_turbine.jpg',
        ],
        creditImages: [
          'https://example.com/images/wind_credit.jpg',
        ],
        paymentMethods: ['Credit Card', 'Bank Transfer'],
        status: 'canceled',
      ),
    ];
  }

  Future<List<Project>> getPendingProjects() async {
    return [
      Project(
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
        status: 'pending',
      ),
      Project(
        projectName: 'Wind Farm Development',
        startDate: '2022-05-20',
        endDate: '2024-05-20',
        location: 'Texas, USA',
        scale: '200 MW',
        scope: 'Generate renewable energy through wind turbines.',
        partners: 'Windy Fields Inc, EcoEnergy Partners',
        issuer: 'Texas Renewable Energy Agency',
        availableCredits: '75000',
        certificates: 'ISO 14001, Green Energy Certificate',
        price: '12.5',
        projectImages: [
          'https://example.com/images/wind_farm.jpg',
          'https://example.com/images/wind_turbine.jpg',
        ],
        creditImages: [
          'https://example.com/images/wind_credit.jpg',
        ],
        paymentMethods: ['Credit Card', 'Bank Transfer'],
        status: 'pending',
      ),
    ];
  }

}
