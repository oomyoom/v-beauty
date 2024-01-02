import 'package:flutter/material.dart';
import 'package:v_beauty/models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                        padding: const EdgeInsets.symmetric(vertical: 8),
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

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      child: Container(
        padding: EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.25,
        child: SafeArea(
          child: Column(
            children: [
              Text('V-Beauty'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w400)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16 * 2),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFE5C1C5);
    Path path = Path()
      ..lineTo(0, size.height * 0.8) // เริ่มต้นจากมุมบนซ้าย
      ..quadraticBezierTo(size.width / 2, size.height, size.width,
          size.height * 0.8) // curve กลาง
      ..lineTo(size.width, 0); // จบที่มุมบนขวา

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
