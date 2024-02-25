import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/order_history/bloc/order_bloc.dart';
import 'package:v_beauty/order_history/view/components/orderHistory/orderId_container.dart';
import 'package:v_beauty/order_history/view/components/orderHistory/total_container.dart';
import 'package:v_beauty/order_history/view/pages/orderDetails_page.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'ประวัติการคำสั่งซื้อ'.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE5C1C5),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return Column(
                children: List.generate(state.orderItems.length, (index) {
                  final item = state.orderItems[index];

                  return Column(
                    children: [
                      InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OrderDetailsPage(
                                    order: item,
                                  )));
                        },
                        child: Column(
                          children: [
                            OrderIdContainer(item: item),
                            TotalContainer(item: item),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      )
                    ],
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
