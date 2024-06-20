import 'package:bloc/bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void nextPage() {
    if (state < 4) emit(state + 1);
  }
  
  void skip() {
  emit(4);
}
}
