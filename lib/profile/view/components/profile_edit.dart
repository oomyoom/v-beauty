import 'package:flutter/material.dart';
import 'package:v_beauty/models/user.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key, required this.profileInfoList});

  final List<ProfileInfoData> profileInfoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'แก้ไขข้อมูล',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
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
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                return ProfileEdit(
                    label: profileInfoList[index].label,
                    uinfo: profileInfoList[index].uinfo);
              }, childCount: profileInfoList.length))),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key, required this.label, required this.uinfo});

  final String label, uinfo;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    _controller.text = uinfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: TextField(
            maxLines: 1,
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.04)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.04)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.04)),
              ),
              labelText: label,
              labelStyle: Theme.of(context).textTheme.bodyMedium!,
              hintText: 'กรอก$label',
              hintStyle: Theme.of(context).textTheme.bodyMedium!,
              //border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
      ],
    );
  }
}
