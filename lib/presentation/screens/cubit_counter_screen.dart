import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {

    final counterState = context.watch<CounterCubit>().state;

    final counter = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title:  Text('Cubit Counter ${counterState.transactionCount}'),
        actions: [
          IconButton(
              onPressed: () => { counter.reset()}, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body:  Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return  Text('Counter value: ${counterState.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1', child: const Text('+3'), onPressed: () => { counter.increaseBy(3) }),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '2', child: const Text('+2'), onPressed: () => {counter.increaseBy(2)}),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: '3', child: const Text('+1'), onPressed: () => {counter.increaseBy(1)}),
        ],
      ),
    );
  }
}