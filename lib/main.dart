import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_beauty/profile/bloc/profile_bloc.dart';
import 'package:v_beauty/profile/repositories/user_repository.dart';
import 'package:v_beauty/widgets/bottomtab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(userRepository: userRepository)
            ..add(ProfileLoad()), // Dispatch the ProfileLoad event
        ),
      ],
      child: MaterialApp(
        title: 'V-Beauty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BottomTab(),
      ),
    );
  }
}
