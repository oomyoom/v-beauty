import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:v_beauty/constant/apiurl.dart';
import 'package:v_beauty/features/register/ui/components/register_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:v_beauty/features/splash/splash_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<void> _submitForm({
    required String username,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('http://${ApiConstants.baseUrl}/register/user');
    final response = await http.post(
      url,
      body: json.encode({
        'UserName': username,
        'Email': email,
        'Password': password,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['message'] == 'Success') {
      // Successfully registered
      print('Registration successful');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SplashScreen()));
    } else {
      // Registration failed
      print('Registration failed');
      // You can handle errors or show an error message here
    }
  }

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmpasswordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(children: [
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Please fill in information'),
              const SizedBox(
                height: 21,
              ),
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius:
                      BorderRadius.circular(20), // กำหนดความโค้งของมุมเป็น 20
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  MyRegisterTextField(
                    hintText: 'UserName',
                    obscureText: false,
                    contorller: userController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyRegisterTextField(
                    hintText: 'Email',
                    obscureText: false,
                    contorller: emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyRegisterTextField(
                    hintText: 'Password',
                    obscureText: true,
                    contorller: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyRegisterTextField(
                    hintText: 'Confirm Password',
                    obscureText: true,
                    contorller: confirmpasswordController,
                  ),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  final username = userController.text;
                  final email = emailController.text;
                  final password = passwordController.text;
                  final confirmPassword = confirmpasswordController.text;
                  // Check if passwords match
                  if (password == confirmPassword) {
                    _submitForm(
                      username: username,
                      email: email,
                      password: password,
                    );
                  } else {
                    // Show password mismatch error
                    print('Passwords do not match');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
