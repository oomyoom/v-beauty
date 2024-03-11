import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_beauty/features/auth/ui/auth_screen.dart';
import 'package:v_beauty/features/splash/splash_screen.dart';
import 'package:v_beauty/features/user_features/home/homeproduct_bloc/homeproduct_bloc.dart';
import 'package:v_beauty/features/user_features/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/features/user_features/profile/repositories/user_repository.dart';
import 'package:v_beauty/repositories/product_api_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final userRepository = UserRepository();
  final productRepository =
      AllProductRepository(); // Initialize your repository here
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AllProductRepository>(
            create: (_) => productRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeproductBloc(productRepository),
            // child: BottomTab(token: prefs.get('token')),
          ),
          // BlocProvider(
          //   create: (create) => CategoryBloc(productRepository),
          // ),
          BlocProvider<ProfileBloc>(
          create: (_) => ProfileBloc(userRepository: userRepository)
            ..add(ProfileLoad()), // Dispatch the ProfileLoad event
        ),
        ],
        child: MyAppView(token: prefs.getString('token')),
      ),
    ),
  );
}

class MyAppView extends StatelessWidget {
  var token;
  MyAppView({@required this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Firebase Auth',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              background: Colors.white,
              onBackground: Colors.black,
              primary: Color.fromRGBO(206, 147, 216, 1),
              onPrimary: Colors.black,
              secondary: Color.fromRGBO(244, 143, 177, 1),
              onSecondary: Colors.white,
              tertiary: Color.fromRGBO(255, 204, 128, 1),
              error: Colors.red,
              outline: Color(0xFF424242)),
        ),
        // home: AuthPage(),
        home: SplashScreen(
          token: token,
        )
        // home: SplashScreen(
        //   token: token,
        // ),
        );
  }
}
