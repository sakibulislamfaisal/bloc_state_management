import 'package:blocstatemanagement/bloc/counter_bloc.dart';
import 'package:blocstatemanagement/bloc/counter_event.dart';
import 'package:blocstatemanagement/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(),
        child: MaterialApp(
          // Application name
          title: 'Flutter Hello World',
          // Application theme data, you can set the colors for the application as
          // you want
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // A widget which will be started on application startup
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          if (state is CounterInit) {
            return _view(context, 0);
          }
          if (state is CounterUpdate) {
            return _view(context, state.counter);
          } else {
            return Container();
          }
        }));
  }

  Widget _view(BuildContext context, int value) {
    final txtStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value.toString(), style: txtStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrease());
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterBloc>().add(CounterDecrease());
              },
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ],
    ));
  }
}
