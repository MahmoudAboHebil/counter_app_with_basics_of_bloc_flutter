import 'package:counter_app_with_basics_of_bloc/business_logic/cubit/internet_cubit.dart';
import 'package:counter_app_with_basics_of_bloc/business_logic/cubit/internet_state.dart';
import 'package:counter_app_with_basics_of_bloc/constants/enums.dart';
import 'package:counter_app_with_basics_of_bloc/persentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.title, required this.colour});

  final String title;
  final Color colour;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colour,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text('Connected with ');
                } else if (state is InternetDisconnected) {
                  return Text(' NO Connection');
                } else {
                  return Text('Loading...');
                }
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              bloc: BlocProvider.of<CounterCubit>(context),
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'NEGATIVE  ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'EVEN  ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Text(
                    'POSTIVE  ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
              },
              listener: (context, state) {
                if (state.wasIncremented!) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(
                        milliseconds: 300,
                      ),
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "btn11",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                  backgroundColor: widget.colour,
                ),
                SizedBox(
                  width: 30,
                ),
                FloatingActionButton(
                  heroTag: "btn22",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  backgroundColor: widget.colour,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Go  to Second Screen'),
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Text('Go  to Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
