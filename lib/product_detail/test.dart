import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  File? image;
  String? _processedImageUrl;

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return;
    }

    final imageTemporary = File(pickedImage.path);
    setState(() {
      image = imageTemporary;
      _processedImageUrl =
          null; // Reset processed image URL when selecting a new image
    });
  }

  Future<void> filterImage() async {
    if (image == null) {
      print('No image selected');
      return;
    }

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.1.105:5000/process_image'));
    request.files.add(await http.MultipartFile.fromPath('image', image!.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var processedImageUrl = json.decode(responseData)['processed_image'];
      setState(() {
        _processedImageUrl = processedImageUrl;
      });
    } else {
      print('Failed to process image. Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child:
                  image != null ? Image.file(image!) : Text('Select an image'),
            ),
            CustomButton(onPressed: pickImage, operator: 'Select'),
            CustomButton(onPressed: filterImage, operator: 'Filter'),
            if (_processedImageUrl != null)
              SizedBox(
                height: 250,
                width: 250,
                child: Image.memory(
                  base64Decode(_processedImageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String operator;

  const CustomButton(
      {Key? key, required this.onPressed, required this.operator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          child: Text(operator),
        ),
      ),
    );
  }
}
