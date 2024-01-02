import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'โปรไฟล์',
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFE5C1C5),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.manage_accounts,
                )),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                color: Color(0xFFFFC1CC),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.47,
                  height: MediaQuery.of(context).size.height * 0.33,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.33,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn.discordapp.com/attachments/808022917489098774/1191821888230543421/108538996_p0.png?ex=65a6d5a1&is=659460a1&hm=dbadb3055fe275ef2f9927fdcdc750f100b6c9a74311a702298fbd861e33b53c&jpg'))),
                ),
              ),
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
                decoration:
                    BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ข้อมูลส่วนตัว',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ชื่อ',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        Text(
                          'TANAKORN',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'นามสกุล',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        Text(
                          'TOSANGUAN',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'วันเกิด',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        Text(
                          'DD/MM/YYYY',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
                decoration:
                    BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ข้อมูลสำหรับติดต่อ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'อีเมล์',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        Text(
                          'oomyoom@xxx.com',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'เบอร์โทร',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                        Text(
                          '09xxxxxxxx',
                          style: Theme.of(context).textTheme.bodyLarge!,
                        ),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
