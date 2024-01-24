import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.enableTap = false,
    this.onTap,
    this.validator,
  });

  final String label;
  final TextEditingController controller;
  final bool enableTap;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            maxLines: 1,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.lightBlue,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.04)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(MediaQuery.of(context).size.width * 0.04)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.04),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width * 0.04),
                ),
              ),
              errorText: validator != null ? validator!(controller.text) : null,
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red),
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
        ),
      ],
    );
  }
}