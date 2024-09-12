import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/counter/cubit/counter_cubit.dart';
import 'package:flutter_notes/counter/cubit/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if(state is CounterInitialState){
            print("CounterInitialState");
          }else if(state is CounterPlusState){
            print("CounterPlusState ${state.Counter}");
          }else if(state is CounterMinusState){
            print("CounterMinusState ${state.Counter}");
          }
        },
        builder: (context, state) {
          var cubit = CounterCubit.get(context);
          return Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: () {
                    cubit.plus();
                  }, child: const Text("+"),),
                  Text("${cubit.counter}"),
                  TextButton(onPressed: () {
                    cubit.minus();
                  }, child: const Text("-"),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
