import 'dart:io';

import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/pages/add_info_project_page.dart';
import 'package:carbon_credit_trading/pages/credit_image_upload_page.dart';
import 'package:carbon_credit_trading/theme/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/pages/project_image_upload_page.dart';

import 'dart:developer';

class ProjectRegistrationPage extends StatefulWidget {
  const ProjectRegistrationPage({super.key});

  @override
  createState() => _ProjectRegistrationPageState();
}

class _ProjectRegistrationPageState extends State<ProjectRegistrationPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

// info registered project
  String _projectName = '';
  String _startDate = '';
  String _endDate = '';
  String _location = '';
  String _scale = '';
  String _scope = '';
  String _partners = '';
  String _issuer = '';
  String _availableCredits = '';
  String _certificates = '';
  String _price = '';
  List<String> _selectedPaymentMethodList = [];
  List<File> _projectImages = [];
  List<File> _creditImages = [];

  void _nextPage() {
    if (_currentIndex < 2) {
      setState(() {
        _currentIndex++;
      });
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _saveProject() {
    final project = Project(
      projectName: _projectName,
      startDate: _startDate,
      endDate: _endDate,
      location: _location,
      scale: _scale,
      scope: _scope,
      partners: _partners,
      issuer: _issuer,
      availableCredits: _availableCredits,
      certificates: _certificates,
      price: _price,
      projectImages: _projectImages,
      creditImages: _creditImages,
      paymentMethods: _selectedPaymentMethodList,
    );
    log('Project Details: \n'
        'Project Name: ${project.projectName}\n'
        'Start Date: ${project.startDate}\n'
        'End Date: ${project.endDate}\n'
        'Location: ${project.location}\n'
        'Scale: ${project.scale}\n'
        'Scope: ${project.scope}\n'
        'Partners: ${project.partners}\n'
        'Issuer: ${project.issuer}\n'
        'Available Credits: ${project.availableCredits}\n'
        'Certificates: ${project.certificates}\n'
        'Price: ${project.price}\n'
        'Payment Methods: ${project.paymentMethods.join(', ')}\n'
        'Project Images: ${project.projectImages.map((file) => file.path).toList()}\n'
        'Credit Images: ${project.creditImages.map((file) => file.path).toList()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Đăng ký dự án",
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swiping
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          AddInfoProjectPage(
            onNext: _nextPage,
            onProjectDataChanged: (Project data) {
              setState(() {
                _projectName = data.projectName;
                _startDate = data.startDate;
                _endDate = data.endDate;
                _location = data.location;
                _scale = data.scale;
                _scope = data.scope;
                _partners = data.partners;
                _issuer = data.issuer;
                _availableCredits = data.availableCredits;
                _certificates = data.certificates;
                _price = data.price;
                _selectedPaymentMethodList = data.paymentMethods;
              });
            },
          ),
          ProjectImageUploadPage(
            onPrevious: _previousPage,
            onNext: (images) {
              setState(() {
                _projectImages = images;
              });
              _nextPage();
            },
          ),
          CreditImageUploadPage(
            onPrevious: _previousPage,
            onSave: (List<File> creditImages) {
              setState(() {
                _creditImages = creditImages;
              });
              _saveProject();
            },
          )
        ],
      ),
    );
  }
}
