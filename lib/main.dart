import 'package:bmi/bloc/bmi_bloc.dart';
import 'package:bmi/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI Calculator',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: SplashView(),
      ),
    );
  }
}
