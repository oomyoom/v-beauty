import 'package:flutter/material.dart';

class ProfileBanner extends StatelessWidget {
  const ProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        color: Color(0xFFFFC1CC),
      ),
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.47,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.discordapp.com/attachments/808022917489098774/1191821888230543421/108538996_p0.png?ex=65a6d5a1&is=659460a1&hm=dbadb3055fe275ef2f9927fdcdc750f100b6c9a74311a702298fbd861e33b53c&jpg'))),
        ),
      ),
    ]);
  }
}
