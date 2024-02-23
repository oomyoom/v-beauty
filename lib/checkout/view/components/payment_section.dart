// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01,
          horizontal: MediaQuery.of(context).size.width * 0.04),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'วิธีการชำระเงิน',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        HorizontalPaymentMethodPicker(
          onSelected: (selectedMethod) {
            print("Selected payment method: $selectedMethod");
          },
        ),
      ]),
    );
  }
}

class HorizontalPaymentMethodPicker extends StatefulWidget {
  const HorizontalPaymentMethodPicker({super.key, required this.onSelected});

  final Function(String) onSelected;

  @override
  _HorizontalPaymentMethodPickerState createState() =>
      _HorizontalPaymentMethodPickerState();
}

class _HorizontalPaymentMethodPickerState
    extends State<HorizontalPaymentMethodPicker> {
  String? _selectedPaymentMethod = 'Credit Card'; // ตั้งค่าเริ่มต้น

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> paymentMethods = [
      {
        "name": "Credit Card",
        "icon": Icons.credit_card,
      },
      {
        "name": "PayPal",
        "icon": Icons.account_balance_wallet,
      },
      {
        "name": "Bank Transfer",
        "icon": Icons.account_balance,
      },
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.11, // ปรับความสูงตามความต้องการ
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedPaymentMethod = paymentMethods[index]['name'];
                widget.onSelected(_selectedPaymentMethod!);
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    paymentMethods[index]['icon'],
                    color:
                        _selectedPaymentMethod == paymentMethods[index]['name']
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                  ),
                  Text(paymentMethods[index]['name']),
                  Radio<String>(
                    value: paymentMethods[index]['name'],
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
