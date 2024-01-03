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
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFE5C1C5),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.06),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFE5C1C5)),
              ),
              child: Text('แก้ไข'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyMedium!),
            ),
          )
        ],
      ),
    );
  }
}
