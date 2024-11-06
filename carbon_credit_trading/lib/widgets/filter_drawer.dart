import 'package:carbon_credit_trading/widgets/custom_year_picker.dart';
import 'package:carbon_credit_trading/widgets/selectable_item.dart';
import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  List<String> selectedPaymentMethods = [];
  List<String> selectedRatings = [];

  final List<String> paymentMethods = [
    'Credit Card',
    'Bank Transfer',
    'PayPal',
    'Cash',
  ];

  final List<String> starRatings = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  DateTimeRange? selectedDateRange;

  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController minYearController = TextEditingController();
  TextEditingController maxYearController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void toggleSelection(String item, List<String> selectedList) {
    setState(() {
      if (selectedList.contains(item)) {
        selectedList.remove(item);
      } else {
        selectedList.add(item);
      }
    });
  }

  void resetFilters() {
    setState(() {
      selectedPaymentMethods.clear();
      selectedRatings.clear();
      selectedDateRange = null;
      minController.clear();
      maxController.clear();
      minYearController.clear();
      maxYearController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      color: Colors.white,
      child: Column(
        children: [
          Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.only(
                  top: 50, bottom: 10, right: 15, left: 15),
              width: double.infinity,
              child: const Text(
                'Lọc theo yêu cầu',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Text(
                  'Hình thức thanh toán',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  children: paymentMethods.map((method) {
                    return SelectableItem(
                      text: method,
                      isSelected: selectedPaymentMethods.contains(method),
                      onToggle: () =>
                          toggleSelection(method, selectedPaymentMethods),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
                  'Thời gian',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomYearPicker(
                        controller: minYearController,
                        labelText: 'Tối thiểu',
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Từ'),
                        startYear: DateTime.now().year,
                        endYear: DateTime.now().year + 100,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomYearPicker(
                        controller: maxYearController,
                        labelText: 'Tối đa',
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Đến'),
                        startYear: DateTime.now().year,
                        endYear: DateTime.now().year + 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
                  'Giá bán mỗi tín chỉ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: minController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Từ', prefixText: '\$'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: maxController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Đến', prefixText: '\$'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
                  'Đánh giá',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  children: starRatings.map((rating) {
                    return SelectableItem(
                      text: '$rating sao',
                      isSelected: selectedRatings.contains(rating),
                      onToggle: () => toggleSelection(rating, selectedRatings),
                    );
                  }).toList(),
                ),
              ],
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: resetFilters,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.green),
                  ),
                  child: const Text(
                    'Đặt lại',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Apply the filters logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Áp dụng',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
