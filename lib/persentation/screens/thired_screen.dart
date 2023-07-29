import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/counter_cubit.dart';

class ThiredScreen extends StatefulWidget {
  const ThiredScreen({required this.title, required this.colour});

  final String title;
  final Color colour;

  @override
  State<ThiredScreen> createState() => _ThiredScreenState();
}

class _ThiredScreenState extends State<ThiredScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colour,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, CounterState>(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
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
                  heroTag: "btn2",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  backgroundColor: widget.colour,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
