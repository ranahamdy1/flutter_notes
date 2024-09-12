abstract class CounterStates {}
class CounterInitialState extends CounterStates {}
class CounterPlusState extends CounterStates {
  int Counter;
  CounterPlusState(this.Counter);
}
class CounterMinusState extends CounterStates {
  int Counter;
  CounterMinusState(this.Counter);
}
