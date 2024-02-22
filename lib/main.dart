import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/cart/bloc/cart_bloc.dart';
import 'package:v_beauty/features/splash/splash_screen.dart';
import 'package:v_beauty/features/user_features/home/homeproduct_bloc/homeproduct_bloc.dart';
import 'package:v_beauty/features/user_features/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/features/user_features/profile/repositories/user_repository.dart';
import 'package:v_beauty/repositories/product_api_repo.dart';
import 'package:v_beauty/utils/appstate_observer.dart';
import 'package:v_beauty/utils/session_expired.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final userRepository = UserRepository();
  final productRepository =
      AllProductRepository(); // Initialize your repository here
  runApp(
    AppLifecycleReactor(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AllProductRepository>(
              create: (_) => productRepository),
          RepositoryProvider<UserRepository>(create: (_) => userRepository)
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  HomeproductBloc(productRepository)..add(LoadHomeproduct()),
              // child: BottomTab(token: prefs.get('token')),
            ),
            // BlocProvider(
            //   create: (create) => CategoryBloc(productRepository),
            // ),
            BlocProvider<CartBloc>(create: (_) => CartBloc()),
            BlocProvider<ProfileBloc>(
              create: (_) => ProfileBloc(
                  userRepository:
                      userRepository), // Dispatch the ProfileLoad event
            ),
          ],
          child: const MyAppView(),
        ),
      ),
    ),
  );
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey, // ใช้ GlobalKey ที่นี่
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
        home: const SplashScreen()
        // home: SplashScreen(
        //   token: token,
        // ),
        );
  }
}
