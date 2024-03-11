import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/cart/view/cart_page.dart';
import 'package:v_beauty/features/user_features/products/ui/product_screen.dart';

import 'package:v_beauty/widget/search.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/repositories/product_api_repo.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AllProductRepository repository = AllProductRepository();

    return CustomPaint(
      painter: CurvePainter(),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        height: MediaQuery.of(context).size.height * 0.25,
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: const Color(0xFFE5C1C5),
                centerTitle: true,
                actions: const [ShoppingCartButton()],
                title: Text('V-Beauty'.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search_rounded),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.06)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.width * 0.06)),
                      ),
                      hintText: 'Search...',
                      hintStyle: Theme.of(context).textTheme.bodyMedium!,
                      //border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                    ),
                    readOnly: true,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => Search(
                              searchFunction: (String searchName) async {
                                return await repository
                                    .searchProductByName(searchName);
                              },
                              onTap: (product) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsPage(
                                              product: product,
                                            )));
                              },
                              title: 'ชื่อสินค้า'))));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.04;
    double fontSize = size * 0.5;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int totalItems = state.cartItems.length;
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),
            if (totalItems > 0) // เงื่อนไขเพื่อไม่แสดงเมื่อไม่มีสินค้า
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(
                      size * 0.2), // ใช้ size ที่คำนวณได้ปรับ padding
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(
                        size), // ใช้ size ปรับรูปทรงให้กลม
                  ),
                  constraints: BoxConstraints(
                    minWidth: size,
                    minHeight: size,
                  ),
                  child: Text(
                    '$totalItems',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize, // ใช้ fontSize ที่คำนวณได้
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFE5C1C5);
    Path path = Path()
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height * 0.8)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
