import 'dart:io';

import 'package:carbon_credit_trading/services/service.dart';

extension FileId on int {
  String toFilePath() {
    return 'http://34.126.176.49:8080/api/file/$this';
  }
}

extension FileUpload on File {
  Future<int> upload() async {
    return fileControllerApi.uploadFile(this);
  }
}