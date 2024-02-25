// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';

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

  final Function(int) onSelected;

  @override
  _HorizontalPaymentMethodPickerState createState() =>
      _HorizontalPaymentMethodPickerState();
}

class _HorizontalPaymentMethodPickerState
    extends State<HorizontalPaymentMethodPicker> {
  int? _selectedPaymentMethod = 1; // ตั้งค่าเริ่มต้น

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> paymentMethods = [
      {
        "id": 1,
        "name": "Credit Card",
        "icon": Icons.credit_card,
      },
      {
        "id": 2,
        "name": "PayPal",
        "icon": Icons.account_balance_wallet,
      },
      {
        "id": 3,
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
                _selectedPaymentMethod = paymentMethods[index]['id'];
                context
                    .read<CartBloc>()
                    .add(CartPayment(_selectedPaymentMethod!));
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
                    color: _selectedPaymentMethod == paymentMethods[index]['id']
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                  Text(paymentMethods[index]['name']),
                  Radio<int>(
                    value: paymentMethods[index]['id'],
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
