import 'package:advice/1_domain/failures/failures.dart';
import 'package:advice/1_domain/usercase/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();
  //could also use other usecases

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    final failureOrAdvice = await adviceUseCases.getAdvice();
    failureOrAdvice.fold(
      (failure) => emit(
          const AdvicerStateError(message: 'an error occured in the process')),
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "oops, API Error, please try again!";
      case CacheFailure:
        return "oops, cache failed, please try again!";
      default:
        return "oops, something went wrong, please try again";
    }
  }
}
