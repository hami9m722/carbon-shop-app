import 'dart:developer';

import 'package:carbon_credit_trading/models/project.dart';
import 'package:carbon_credit_trading/pages/add_info_project_page.dart';
import 'package:carbon_credit_trading/pages/credit_image_upload_page.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/pages/project_image_upload_page.dart';

class ProjectRegistrationPage extends StatefulWidget {
  final Project? initialProject;
  const ProjectRegistrationPage({super.key, this.initialProject});

  @override
  createState() => _ProjectRegistrationPageState();
}

class _ProjectRegistrationPageState extends State<ProjectRegistrationPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
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
  List<dynamic> _projectImages = [];
  List<dynamic> _creditImages = [];

  @override
  void initState() {
    super.initState();
    _projectName = widget.initialProject!.projectName;
    _startDate = widget.initialProject!.startDate;
    _endDate = widget.initialProject!.endDate;
    _location = widget.initialProject!.location;
    _scale = widget.initialProject!.scale;
    _scope = widget.initialProject!.scope;
    _partners = widget.initialProject!.partners;
    _issuer = widget.initialProject!.issuer;
    _availableCredits = widget.initialProject!.availableCredits;
    _certificates = widget.initialProject!.certificates;
    _price = widget.initialProject!.price;
    _selectedPaymentMethodList = widget.initialProject!.paymentMethods;
    _projectImages = widget.initialProject!.projectImages;
    _creditImages = widget.initialProject!.creditImages;
  }

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
        status: 'pending');

    if (widget.initialProject != null) {
      log(project.endDate);
    } else {
      log(project.startDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            initialProject: Project(
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
              paymentMethods: _selectedPaymentMethodList,
              status: 'pending',
            ),
            onNext: _nextPage,
            onProjectDataChanged: (data) {
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
            initialImages: _projectImages,
            onPrevious: _previousPage,
            onNext: (images) {
              setState(() {
                _projectImages = images;
              });
              _nextPage();
            },
          ),
          CreditImageUploadPage(
            initialImages: _creditImages,
            onPrevious: _previousPage,
            onSave: (creditImages) {
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
