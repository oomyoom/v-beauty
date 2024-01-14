import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key,
      required this.title,
      required this.press,
      required this.labelbutton});

  final String title, labelbutton;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      TextButton(
        onPressed: press,
        style: TextButton.styleFrom(foregroundColor: Colors.pink),
        child: Text(
          labelbutton,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.pink),
        ),
      )
    ]);
  }
}
