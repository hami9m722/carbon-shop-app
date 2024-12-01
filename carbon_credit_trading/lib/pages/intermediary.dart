import 'package:flutter/material.dart';

class IntermediaryPage extends StatelessWidget {
  const IntermediaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Doanh Nghiệp'),
            automaticallyImplyLeading: false,
          ),
          body: const Center(child: Text('Trang doanh nghiệp')),
        ));
  }
}
