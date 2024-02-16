import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:v_beauty/features/user_features/home/homeproduct_bloc/homeproduct_bloc.dart';
import 'package:v_beauty/features/user_features/home/ui/components/custom_appbar.dart';
import 'package:v_beauty/features/user_features/home/ui/components/product_contain.dart';
import 'package:v_beauty/features/user_features/profile/ui/components/profile_logout.dart';
import 'package:v_beauty/repositories/product_api_repo.dart';
import 'package:v_beauty/widget/section_title.dart';

class HomePage extends StatefulWidget {
  final token;
  const HomePage({@required this.token, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String email;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken['email'];
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = MediaQuery.of(context).size.height * 0.25;
    return BlocProvider(
      create: (context) =>
          HomeproductBloc(RepositoryProvider.of<AllProductRepository>(context))
            ..add(LoadHomeproduct()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: const CustomAppBar(),
        ),
        backgroundColor: Colors.grey[200],
        body: BlocBuilder<HomeproductBloc, HomeproductState>(
          builder: (context, state) {
            if (state is HomeproductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeproductLoadedState) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        GestureDetector(
                          child: const Text('Logout'),
                          onTap: () {
                            print('LogOut');
                            showLogoutConfirmationDialog(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.02,
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.jdmagicbox.com/rep/b2b/beauty-cosmetics/beauty-cosmetics-3.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02),
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
                        product: state.lipMakeup,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01),
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
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      // child: Container(),
                      child: ProductContent(product: state.faceMakeup),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SectionTitle(
                        title: 'สำหรับคุณผู้ชาย',
                        press: () {},
                        labelbutton: 'ดูทั้งหมด',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      // child: Container(),
                      child: ProductContent(product: state.menMakeup),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SectionTitle(
                        title: 'Skincare',
                        press: () {},
                        labelbutton: 'ดูทั้งหมด',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      // child: Container(),
                      child: ProductContent(product: state.skinCare),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: SectionTitle(
                        title: 'Eye Makeup',
                        press: () {},
                        labelbutton: 'ดูทั้งหมด',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      // child: Container(),
                      child: ProductContent(product: state.eyeMakeup),
                    ),
                  ),
                ],
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
      ),
    );
  }
}
