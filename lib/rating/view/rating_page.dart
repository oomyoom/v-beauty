// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:v_beauty/rating/bloc/rating_bloc.dart';
import 'package:v_beauty/rating/repositories/rating_repo.dart';
import 'package:v_beauty/widget/bottom_tab.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    StarRatingBloc starRatingBloc = StarRatingBloc();
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('ให้คะแนน'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFE5C1C5),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<StarRatingBloc, StarRatingState>(
              builder: (context, state) {
                return RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  //allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    starRatingBloc.add(StarRatingChanged(rating));
                  },
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
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
                hintText: 'Comment',
                hintStyle: Theme.of(context).textTheme.bodyMedium!,
                //border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ElevatedButton(
              onPressed: () async {
                final state = starRatingBloc.state;
                if (state is StarRatingUpdated) {
                  await RatingRepository().submitRating(
                      productId, state.rating.toInt(), controller.text);
                }
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const BottomTab()),
                  (Route<dynamic> route) => false, // ไม่เก็บหน้าใดๆ เอาไว้
                );
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(
                    MediaQuery.of(context).size.width * 0.4,
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xFFE5C1C5),
                ),
              ),
              child: Text(
                'ส่ง'.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
