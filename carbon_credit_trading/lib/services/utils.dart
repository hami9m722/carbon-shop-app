import 'package:carbon_credit_trading/models/message.dart';
import 'package:intl/intl.dart';

String getTransactionStatusMessage(String status) {
  if (status == 'approved') {
    return 'đã thành công';
  } else if (status == 'pending') {
    return 'đang được duyệt, trạng thái mới sẽ được cập nhật chậm nhất ngày 17/09/2024';
  } else if (status == 'canceled') {
    return 'đã hủy';
  } else {
    return 'có trạng thái không xác định';
  }
}

Map<String, List<Message>> groupMessagesByDate(List<Message> messages) {
  final Map<String, List<Message>> groupedMessages = {};

  for (final message in messages) {
    final dateKey = DateFormat('dd/MM/yyyy').format(message.timestamp);
    if (groupedMessages[dateKey] == null) {
      groupedMessages[dateKey] = [];
    }
    groupedMessages[dateKey]!.add(message);
  }

  return groupedMessages;
}

bool isToday(String date) {
  final now = DateTime.now();
  final parsedDate = DateFormat('dd/MM/yyyy').parse(date);
  return now.year == parsedDate.year &&
         now.month == parsedDate.month &&
         now.day == parsedDate.day;
}
