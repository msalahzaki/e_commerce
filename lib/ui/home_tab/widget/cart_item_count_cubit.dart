import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCountCubit extends Cubit<int> {
  CartItemCountCubit() : super(0); // Initial count is 0

  void updateCartCount(int count) {
    emit(count); // Update the count
  }

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
