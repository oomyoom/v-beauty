import 'package:flutter/material.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit(
      {super.key,
      required this.label,
      required this.uinfo,
      required this.enableTap,
      required this.onTap,
      required this.validator});

  final String label, uinfo;
  final bool enableTap;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    _controller.text = uinfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
            readOnly: enableTap,
            validator: validator,
            onTap: enableTap ? onTap : null),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        )
      ],
    );
  }
}
