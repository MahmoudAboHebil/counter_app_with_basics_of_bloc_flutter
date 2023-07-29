import 'package:counter_app_with_basics_of_bloc/persentation/screens/home_screen.dart';
import 'package:counter_app_with_basics_of_bloc/persentation/screens/second_screen.dart';
import 'package:counter_app_with_basics_of_bloc/persentation/screens/thired_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(
                  title: 'First Screen',
                  colour: Colors.lightBlueAccent,
                ),
              ),
          '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: SecondScreen(
                  title: 'Second Screen', colour: Colors.redAccent)),
          '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: ThiredScreen(
                  title: 'Third Screen', colour: Colors.lightGreen)),
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterCubit.close();
  }
}
