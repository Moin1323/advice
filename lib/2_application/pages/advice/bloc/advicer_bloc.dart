import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      //execute business logic
      //for example get an advice
      debugPrint("fake advice for user  triggerd");
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint("Advice recived");
      emit(AdvicerStateLoaded(advice: "fake advice to test bloc "));
      //emit(AdvicerStateError(message: "an error occured in the process"));
    });
  }
}
