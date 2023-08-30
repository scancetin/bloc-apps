part of 'box_bloc.dart';

sealed class BoxEvent extends Equatable {
  const BoxEvent();

  @override
  List<Object> get props => [];
}

class LoadBoxCounter extends BoxEvent {}

class AddBox extends BoxEvent {
  final Box box;

  const AddBox(this.box);

  @override
  List<Object> get props => [box];
}

class RemoveBox extends BoxEvent {
  final Box box;

  const RemoveBox(this.box);

  @override
  List<Object> get props => [box];
}
