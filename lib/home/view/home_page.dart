import 'package:flutter/material.dart';
import 'package:v_beauty/models/product.dart';

import 'package:v_beauty/home/view/components/custom_appbar.dart';
import 'package:v_beauty/home/view/components/product_content.dart';
import 'package:v_beauty/widgets/section_title.dart';

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
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            sliver: SliverToBoxAdapter(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.02),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.jdmagicbox.com/rep/b2b/beauty-cosmetics/beauty-cosmetics-3.jpg'))),
            )),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: 'ลิปสติก',
                press: () {},
                labelbutton: 'ดูทั้งหมด',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ProductContent(
                product: productData,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            sliver: SliverToBoxAdapter(
                child: SectionTitle(
              title: 'บลัชออน',
              press: () {},
              labelbutton: 'ดูทั้งหมด',
            )),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ProductContent(product: productData2)),
          )
        ],
      ),
    );
  }
}
