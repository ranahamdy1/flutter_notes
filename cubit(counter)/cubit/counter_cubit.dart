import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }

}
