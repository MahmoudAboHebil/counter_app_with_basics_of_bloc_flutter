import 'package:counter_app_with_basics_of_bloc/business_logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home_screen.dart';
import '../screens/second_screen.dart';
import '../screens/thired_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            title: 'First Screen',
            colour: Colors.lightBlueAccent,
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (context) =>
              SecondScreen(title: 'Second Screen', colour: Colors.redAccent),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) =>
              ThiredScreen(title: 'Third Screen', colour: Colors.lightGreen),
        );
    }
  }
}
