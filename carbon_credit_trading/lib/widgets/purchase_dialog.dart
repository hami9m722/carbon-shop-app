// purchase_dialog.dart
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/custom_ricktext.dart';
import 'package:flutter/material.dart';

class PurchaseDialog extends StatefulWidget {
  final double pricePerUnit;
  final int maxQuantity;
  final Function(double, int) onPurchase;

  const PurchaseDialog({
    super.key,
    required this.pricePerUnit,
    required this.maxQuantity,
    required this.onPurchase,
  });

  @override
  createState() => _PurchaseDialogState();
}

class _PurchaseDialogState extends State<PurchaseDialog> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 300,
          constraints: const BoxConstraints(minHeight: 200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Số lượng',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.green),
                    onPressed: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--; // Decrease quantity
                        });
                      }
                    },
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.green),
                    onPressed: () {
                      if (quantity < widget.maxQuantity) {
                        setState(() {
                          quantity++;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              customRichText(
                title: 'Tổng giá:',
                value:
                    '${(widget.pricePerUnit * quantity).toStringAsFixed(0)} USD',
                valueColor: AppColors.greenButton,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  widget.onPurchase(widget.pricePerUnit, quantity);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.greenButton,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                ),
                child: const Text(
                  'Xác nhận gửi giao dịch',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
