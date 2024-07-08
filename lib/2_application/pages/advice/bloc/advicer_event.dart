part of 'advicer_bloc.dart';

sealed class AdvicerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdviceRequestedEvent extends AdvicerEvent {}
