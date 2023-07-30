import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app_with_basics_of_bloc/business_logic/cubit/counter_cubit.dart';
import 'package:counter_app_with_basics_of_bloc/business_logic/cubit/internet_cubit.dart';
import 'package:counter_app_with_basics_of_bloc/persentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(AppRouter(), Connectivity()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp(this.appRouter, this.connectivity);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            internetCubit: BlocProvider.of<InternetCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.onGeneratorRoute,
      ),
    );
  }
}
