part of 'box_bloc.dart';

sealed class BoxState extends Equatable {
  const BoxState();

  @override
  List<Object> get props => [];
}

final class BoxInitial extends BoxState {}

final class BoxLoaded extends BoxState {
  final List<Box> boxes;

  const BoxLoaded({required this.boxes});

  @override
  List<Object> get props => boxes;
}
