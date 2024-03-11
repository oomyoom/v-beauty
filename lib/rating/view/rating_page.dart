import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:v_beauty/rating/bloc/rating_bloc.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    StarRatingBloc _starRatingBloc = StarRatingBloc();

    return Scaffold(
      body: Center(
        child: RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          //allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            _starRatingBloc.add(StarRatingChanged(rating.toInt()));
          },
        ),
      ),
    );
  }
}
