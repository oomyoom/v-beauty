import 'package:flutter/material.dart';

class PersonalEdit extends StatelessWidget {
  const PersonalEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'แก้ไขข้อมูล',
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        elevation: 0,
        backgroundColor: Color(0xFFE5C1C5),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ชื่อ',
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.04),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'กรอกชื่อ',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'นามสกุล',
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.04),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'กรอกนามสกุล',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'วันเกิด',
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.04),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'กรอกวันเกิด',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.04),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.12),
            sliver: SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.06),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFE5C1C5))),
                child: Text('แก้ไข'.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!),
              ),
            ),
          )
        ],
      ),
    );
  }
}
