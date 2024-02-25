import 'package:flutter/material.dart';
import 'package:v_beauty/order_history/view/pages/orderHistory_page.dart';

class ProfileFeatures extends StatelessWidget {
  const ProfileFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.star_rate_rounded)),
                const Text('การให้คะแนน')
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const OrderHistoryPage())));
                    },
                    icon: const Icon(Icons.history_rounded)),
                const Text('ประวัติคำสั่งซื้อ')
              ],
            )
          ],
        ),
      ),
    );
  }
}
