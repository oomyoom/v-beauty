import 'package:flutter/material.dart';
import 'package:v_beauty/home/view/components/customappbar.dart';
import 'package:v_beauty/models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GridTile(
                    child: ListTile(
                      title: Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: NetworkImage(productData[index].image)),
                            border: Border.all(color: Colors.black, width: 0.4),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(productData[index].title),
                            Text(productData[index].price.toStringAsFixed(0) +
                                ' ฿')
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: productData.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
