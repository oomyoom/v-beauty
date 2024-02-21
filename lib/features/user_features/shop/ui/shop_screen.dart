import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/features/user_features/home/homeproduct_bloc/homeproduct_bloc.dart';
import 'package:v_beauty/widget/custom_appbar.dart';
import 'package:v_beauty/features/user_features/shop/ui/components/product_card.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {

  @override
  Widget build(BuildContext context) {
    final appBarHeight = MediaQuery.of(context).size.height * 0.25;
    context.read<HomeproductBloc>().add(LoadHomeproduct());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const CustomAppBar(),
      ),
      body: BlocBuilder<HomeproductBloc, HomeproductState>(
        builder: (context, state) {
          if (state is HomeproductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeproductLoadedState) {
            return DefaultTabController(
              length: 6, // Number of tabs
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints.expand(height: 50),
                    child: const TabBar(
                      isScrollable: true, // Allow tabs to scroll horizontally
                      labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      tabs: [
                        Tab(text: 'ALL'),
                        Tab(text: 'Face Makeup'),
                        Tab(
                          text: 'Lip Makeup',
                        ),
                        Tab(
                          text: 'Eye Makeup',
                        ),
                        Tab(
                          text: 'Skin Care',
                        ),
                        Tab(
                          text: "Men's Makeup",
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: state.allProducts.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                product: state.allProducts[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: state.faceMakeup.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                product: state.faceMakeup[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: state.lipMakeup.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                product: state.lipMakeup[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: state.eyeMakeup.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                product: state.eyeMakeup[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: state.skinCare.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                product: state.skinCare[index]);
                          },
                        ),
                        ListView.builder(
                          itemCount: state.menMakeup.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                                product: state.menMakeup[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is HomeproductErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }
}
